import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../globals.dart';
import 'state_method.dart';

typedef ChoiceChipInputChanged<T> = void Function(
  T? value,
  List<String> textList,
);

/// A widget to take input by selecting [ChoiceChip] and entering relevant data
/// in [TextField]
class ChoiceChipInputWidget<T> extends StatefulWidget {
  const ChoiceChipInputWidget({
    super.key,
    this.keyPrefix = defaultKeyPrefix,
    this.title,
    required this.values,
    required this.labels,
    this.keys,
    required this.selected,
    required this.textList,
    this.keyboardTypes,
    this.inputFormattersList,
    this.textFieldWidth = defaultTextFieldWidth,
    this.textFieldTextAlign = defaultTextAlign,
    this.spacing = defaultSpacing,
    this.enabled = true,
    this.disableInputs = false,
    this.onStateChanged,
  })  : assert(labels.length == values.length),
        assert(keys == null || keys.length == values.length),
        assert(textList.length == values.length),
        assert(keyboardTypes == null || keyboardTypes.length == values.length),
        assert(inputFormattersList == null ||
            inputFormattersList.length == values.length);

  final String keyPrefix;
  final String? title;
  final Set<T> values;
  final Set<String> labels;
  final Set<String>? keys;
  final T? selected;
  final List<String> textList;
  final List<TextInputType>? keyboardTypes;
  final List<List<TextInputFormatter>?>? inputFormattersList;
  final double textFieldWidth;
  final TextAlign textFieldTextAlign;
  final double spacing;
  final bool enabled;
  final bool disableInputs;
  final ChoiceChipInputChanged<T>? onStateChanged;
  static const double defaultTextFieldWidth = 150;
  static const TextAlign defaultTextAlign = TextAlign.center;
  static const double defaultSpacing = 8;
  static const String defaultKeyPrefix = 'choice_chip_input_widget_';
  static const String defaultKey = '${defaultKeyPrefix}_key';
  static const String titleKey = 'title_key';
  static const String textFieldKey = 'text_field_key';

  @override
  State<ChoiceChipInputWidget<T>> createState() =>
      _ChoiceChipInputWidgetState<T>();
}

class _ChoiceChipInputWidgetState<T> extends State<ChoiceChipInputWidget<T>> {
  int? selectedIndex;
  late List<String> textList;
  late final TextEditingController textController;
  late final FocusNode textFocusNode;
  StreamSubscription<bool>? keyboardSubscription;
  bool? keyboardVisible;
  late bool requiresKeyboardChange;

  @override
  void initState() {
    super.initState();
    _initOrUpdate(method: StateMethod.initState);
  }

  @override
  void didUpdateWidget(covariant ChoiceChipInputWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initOrUpdate(method: StateMethod.didUpdateWidget);
  }

  void _initOrUpdate({
    required StateMethod method,
  }) {
    if (widget.selected != null) {
      final index = widget.values.toList().indexOf(widget.selected as T);
      selectedIndex = index >= 0 ? index : null;
    } else {
      selectedIndex = null;
    }
    textList = List.from(widget.textList);
    if (method == StateMethod.initState) {
      textController = TextEditingController();
      textFocusNode = FocusNode();
    }
    if (selectedIndex != null) {
      if (textController.text != textList[selectedIndex!]) {
        textController.text = textList[selectedIndex!];
      }
    } else if (!textList.contains(textController.text)) {
      // Reset or mismatch
      textController.text = '';
    }
    requiresKeyboardChange = widget.keyboardTypes != null &&
        widget.keyboardTypes!.toSet().length > 1;
    if (keyboardVisibilitySupported && requiresKeyboardChange) {
      if (keyboardSubscription == null) {
        final keyboardVisibilityController = KeyboardVisibilityController();
        keyboardVisible = keyboardVisibilityController.isVisible;
        keyboardSubscription =
            keyboardVisibilityController.onChange.listen((bool visible) {
          keyboardVisible = visible;
        });
      }
    } else {
      keyboardSubscription?.cancel();
      keyboardSubscription = null;
      keyboardVisible = null;
    }
  }

  @override
  void dispose() {
    textController.dispose();
    textFocusNode.dispose();
    keyboardSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null && widget.title!.isNotEmpty)
          Text(
            key: Key('${widget.keyPrefix}${ChoiceChipInputWidget.titleKey}'),
            widget.title!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        if (widget.title != null && widget.title!.isNotEmpty)
          SizedBox(height: widget.spacing),
        _getChoiceChips(context: context),
        if (widget.values.isNotEmpty) SizedBox(height: widget.spacing * 2),
        if (widget.values.isNotEmpty) _getTextField(context: context),
      ],
    );
  }

  Widget _getChoiceChips({
    required BuildContext context,
  }) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.spacing,
      alignment: WrapAlignment.center,
      children: List<Widget>.generate(
        widget.values.length,
        (index) {
          return AbsorbPointer(
            absorbing: widget.disableInputs,
            child: TextFieldTapRegion(
              child: ChoiceChip(
                key: widget.keys != null
                    ? Key('${widget.keyPrefix}${widget.keys!.elementAt(index)}')
                    : null,
                label: Text(
                  widget.labels.elementAt(index),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                selected: selectedIndex == index,
                onSelected: widget.enabled == true
                    ? (selected) {
                        setState(() {
                          selectedIndex = selected ? index : null;
                        });
                        if (selectedIndex != null) {
                          if (textFocusNode.hasFocus &&
                              requiresKeyboardChange) {
                            if (keyboardVisible == true ||
                                !keyboardVisibilitySupported) {
                              textFocusNode.unfocus();
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) => textFocusNode.requestFocus(),
                              );
                            }
                          }
                          textController.text = textList[selectedIndex!];
                        }
                        _callOnStateChanged();
                      }
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getTextField({
    required BuildContext context,
  }) {
    return SizedBox(
      width: widget.textFieldWidth,
      child: AbsorbPointer(
        absorbing: widget.disableInputs,
        child: TextField(
          key: Key('${widget.keyPrefix}${ChoiceChipInputWidget.textFieldKey}'),
          enabled: widget.enabled && selectedIndex != null,
          controller: textController,
          focusNode: textFocusNode,
          keyboardType: widget.keyboardTypes != null && selectedIndex != null
              ? widget.keyboardTypes![selectedIndex!]
              : null,
          inputFormatters:
              widget.inputFormattersList != null && selectedIndex != null
                  ? widget.inputFormattersList![selectedIndex!]
                  : null,
          textAlign: widget.textFieldTextAlign,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
          ),
          onTapOutside: (event) {
            if (textFocusNode.hasFocus) {
              textFocusNode.unfocus();
            }
          },
          onChanged: (text) {
            textList[selectedIndex!] = text;
            _callOnStateChanged();
          },
        ),
      ),
    );
  }

  void _callOnStateChanged() {
    if (widget.onStateChanged != null) {
      final T? value = selectedIndex != null
          ? widget.values.elementAt(selectedIndex!)
          : null;
      widget.onStateChanged!(value, textList);
    }
  }
}
