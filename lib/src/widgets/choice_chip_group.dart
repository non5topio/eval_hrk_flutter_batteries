import 'package:flutter/material.dart';

import '../../hrk_flutter_batteries.dart';

typedef ChipSelected<T> = void Function(T? value);

class ChoiceChipGroup<T> extends StatelessWidget {
  const ChoiceChipGroup({
    super.key,
    this.keyPrefix = '',
    this.enabled = true,
    this.title,
    required this.values,
    required this.labels,
    this.keys,
    this.selected,
    this.disableInputs = false,
    this.spacing = HrkDimensions.bodyItemSpacing,
    this.onChipSelected,
  })  : assert(labels.length == values.length),
        assert(keys == null || keys.length == values.length);

  final String keyPrefix;
  final bool enabled;
  final String? title;
  final Set<T> values;
  final Set<String> labels;
  final Set<String>? keys;
  final T? selected;
  final bool disableInputs;
  final double spacing;
  final ChipSelected<T>? onChipSelected;
  static const String defaultKeyPrefix = 'choice_chip_group_';

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disableInputs,
      child: Column(
        children: [
          if (title != null)
            Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          if (title != null) SizedBox(height: spacing),
          _getChoiceChips(context)
        ],
      ),
    );
  }

  Wrap _getChoiceChips(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: WrapAlignment.center,
      children: List<Widget>.generate(
        values.length,
        (index) {
          return ChoiceChip(
            key: keys != null
                ? Key('$keyPrefix${keys!.elementAt(index)}')
                : null,
            label: Text(
              labels.elementAt(index),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            selected: selected == values.elementAt(index),
            onSelected: enabled
                ? (selected) {
                    _onSelected(selected, index);
                  }
                : null,
          );
        },
      ),
    );
  }

  void _onSelected(bool selected, int index) {
    if (onChipSelected != null) {
      final T? value = selected ? values.elementAt(index) : null;
      onChipSelected!(value);
    }
  }
}
