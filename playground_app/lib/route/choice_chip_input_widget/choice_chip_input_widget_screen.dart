import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_nasa_apis/hrk_nasa_apis.dart';

import '../../model/human_selector.dart';
import '../../widgets/app_bar.dart';

class ChoiceChipInputWidgetScreen extends StatefulWidget {
  const ChoiceChipInputWidgetScreen({
    super.key,
    required this.title,
    required this.l10n,
    this.routeExtraMap,
  });

  final String title;
  final AppLocalizations l10n;
  final JsonMap? routeExtraMap;
  static const Set<SmallBodySelector> smallBodySelectors = {
    SmallBodySelector.spkId,
    SmallBodySelector.designation,
  };
  static const Set<StudentSelector> studentSelectors = {
    StudentSelector.id,
    StudentSelector.name,
    StudentSelector.cgpa,
  };
  static final Set<String> smallBodySelectorKeys =
      smallBodySelectors.map((e) => e.name).toSet();
  static final Set<String> studentSelectorKeys =
      studentSelectors.map((e) => e.name).toSet();
  static final List<String> emptySmallBodyTextList = List.filled(
    smallBodySelectors.length,
    '',
  );
  static final List<String> emptyStudentTextList = List.filled(
    studentSelectors.length,
    '',
  );
  static const List<TextInputType> smallBodySelectorInputType = [
    TextInputType.number,
    TextInputType.text,
  ];
  static const List<TextInputType> studentSelectorInputType = [
    TextInputType.number,
    TextInputType.text,
    TextInputType.numberWithOptions(decimal: true),
  ];
  static final List<List<TextInputFormatter>?> smallBodyFormatterList = [
    [FilteringTextInputFormatter.digitsOnly],
    null
  ];
  static final List<List<TextInputFormatter>?> studentFormatterList = [
    [FilteringTextInputFormatter.digitsOnly],
    null,
    // LABEL: eligible-hrk_flutter_batteries
    [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
  ];
  static const String keyPrefix = 'choice_chip_input_widget_screen_';
  static const Key resetKey = Key('${keyPrefix}reset_key');
  static const Key customScrollViewKey = Key('${keyPrefix}scroll_view_key');
  static const String demoKeyPrefix = '${keyPrefix}demo_';

  @override
  State<ChoiceChipInputWidgetScreen> createState() =>
      ChoiceChipInputWidgetScreenState();

  static String getDemoKeyPrefix(int index) {
    return '$demoKeyPrefix${index}_';
  }

  static Key getDemoScaffoldKey(int index) {
    return Key('${getDemoKeyPrefix(index)}_scaffold_key');
  }

  static Key getDemoHeaderKey(int index) {
    return Key('${getDemoKeyPrefix(index)}_header_key');
  }

  static Key getDemoKey(int index) {
    return Key('${getDemoKeyPrefix(index)}key');
  }
}

@visibleForTesting
class ChoiceChipInputWidgetScreenState
    extends State<ChoiceChipInputWidgetScreen> {
  late AppLocalizations l10n;
  late Set<String> smallBodySelectorLabels;
  late Set<String> studentSelectorLabels;
  SmallBodySelector? selector0;
  late List<String> textList0;
  SmallBodySelector? selector1;
  late List<String> textList1;
  StudentSelector? selector2;
  late List<String> textList2;
  SmallBodySelector? selector3;
  late List<String> textList3;
  StudentSelector? selector4;
  late List<String> textList4;
  SmallBodySelector? selector5;
  late List<String> textList5;
  SmallBodySelector? selector6;
  late List<String> textList6;
  SmallBodySelector? selector7;
  late List<String> textList7;
  SmallBodySelector? selector8;
  late List<String> textList8;

  @override
  void initState() {
    super.initState();
    _initOrResetState();
  }

  void _initOrResetState() {
    selector0 = null;
    textList0 = List.from(ChoiceChipInputWidgetScreen.emptySmallBodyTextList);
    selector1 = null;
    textList1 = List.from(ChoiceChipInputWidgetScreen.emptySmallBodyTextList);
    selector2 = StudentSelector.cgpa;
    textList2 = ['123', 'Hrishikesh', '.5'];
    selector3 = null;
    textList3 = List.from(ChoiceChipInputWidgetScreen.emptySmallBodyTextList);
    selector4 = null;
    textList4 = List.from(ChoiceChipInputWidgetScreen.emptyStudentTextList);
    selector5 = null;
    textList5 = List.from(ChoiceChipInputWidgetScreen.emptySmallBodyTextList);
    selector6 = SmallBodySelector.designation;
    textList6 = ['54354503', '2023 HK'];
    selector7 = null;
    textList7 = [''];
    selector8 = null;
    textList8 = [];
  }

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context);
    smallBodySelectorLabels = {
      SmallBodySelector.spkId.displayName,
      l10n.designation,
    };
    studentSelectorLabels = {
      StudentSelector.id.displayName,
      l10n.name,
      StudentSelector.cgpa.displayName,
    };
    return Scaffold(
      body: _getBody(context: context),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  Widget _getBody({required BuildContext context}) {
    return CustomScrollView(
      key: ChoiceChipInputWidgetScreen.customScrollViewKey,
      controller: ScrollController(),
      slivers: [
        getSliverAppBar(
          context: context,
          title: Tooltip(
            message: widget.title,
            child: Text(widget.title),
          ),
          actions: getAppBarActions(context: context),
          floating: true,
          snap: true,
        ),
        ..._getSliverBody(context: context),
      ],
    );
  }

  List<Widget> getAppBarActions({required BuildContext context}) {
    return [
      IconButton(
        key: ChoiceChipInputWidgetScreen.resetKey,
        tooltip: 'Reset',
        icon: const Icon(Icons.history),
        onPressed: () {
          setState(() {
            _initOrResetState();
          });
        },
      ),
      ...getDefaultAppBarActions(context: context),
    ];
  }

  List<Widget> _getSliverBody({required BuildContext context}) {
    int demoIndex = 0;
    return [
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      ),
      _getDemo0(context: context, demoIndex: demoIndex++),
      _getDemo1(context: context, demoIndex: demoIndex++),
      _getDemo2(context: context, demoIndex: demoIndex++),
      _getDemo3(context: context, demoIndex: demoIndex++),
      _getDemo4(context: context, demoIndex: demoIndex++),
      _getDemo5(context: context, demoIndex: demoIndex++),
      _getDemo6(context: context, demoIndex: demoIndex++),
      _getDemo7(context: context, demoIndex: demoIndex++),
      _getDemo8(context: context, demoIndex: demoIndex++),
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      )
    ];
  }

  Widget _getDemoScaffold({
    required BuildContext context,
    required int demoIndex,
    required String demoHeader,
    required Widget demoWidget,
  }) {
    return SliverPadding(
      key: ChoiceChipInputWidgetScreen.getDemoScaffoldKey(demoIndex),
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Text(
              demoHeader,
              key: ChoiceChipInputWidgetScreen.getDemoHeaderKey(demoIndex),
              style: _getDemoHeaderTextStyle(context: context),
            ),
            const SizedBox(height: HrkDimensions.bodyItemSpacing),
            demoWidget,
          ],
        ),
      ),
    );
  }

  TextStyle _getDemoHeaderTextStyle({required BuildContext context}) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.tertiary,
    );
  }

  Widget _getDemo0({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Basic',
      demoWidget: ChoiceChipInputWidget<SmallBodySelector>(
        key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
        keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
        values: ChoiceChipInputWidgetScreen.smallBodySelectors,
        labels: smallBodySelectorLabels,
        keys: ChoiceChipInputWidgetScreen.smallBodySelectorKeys,
        selected: selector0,
        textList: textList0,
        onStateChanged: (value, textList) {
          setState(() {
            selector0 = value;
            textList0 = textList;
          });
        },
      ),
    );
  }

  Widget _getDemo1({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'title, keyboardTypes, inputFormattersList',
      demoWidget: BodyItemContainer(
        child: ChoiceChipInputWidget<SmallBodySelector>(
          key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
          title: l10n.demoIndex(demoIndex),
          values: ChoiceChipInputWidgetScreen.smallBodySelectors,
          labels: smallBodySelectorLabels,
          keys: ChoiceChipInputWidgetScreen.smallBodySelectorKeys,
          selected: selector1,
          textList: textList1,
          keyboardTypes: ChoiceChipInputWidgetScreen.smallBodySelectorInputType,
          inputFormattersList:
              ChoiceChipInputWidgetScreen.smallBodyFormatterList,
          onStateChanged: (value, textList) {
            setState(() {
              selector1 = value;
              textList1 = textList;
            });
          },
        ),
      ),
    );
  }

  Widget _getDemo2({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: '3 ChoiceChips, keyboardTypes, inputFormattersList',
      demoWidget: BodyItemContainer(
        child: ChoiceChipInputWidget<StudentSelector>(
          key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
          title: l10n.demoIndex(demoIndex),
          values: ChoiceChipInputWidgetScreen.studentSelectors,
          labels: studentSelectorLabels,
          keys: ChoiceChipInputWidgetScreen.studentSelectorKeys,
          selected: selector2,
          textList: textList2,
          keyboardTypes: ChoiceChipInputWidgetScreen.studentSelectorInputType,
          inputFormattersList: ChoiceChipInputWidgetScreen.studentFormatterList,
          onStateChanged: (value, textList) {
            setState(() {
              selector2 = value;
              textList2 = textList;
            });
          },
        ),
      ),
    );
  }

  Widget _getDemo3({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'textFieldWidth, textFieldTextAlign, spacing',
      demoWidget: BodyItemContainer(
        child: ChoiceChipInputWidget<SmallBodySelector>(
          key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
          title: l10n.demoIndex(demoIndex),
          values: ChoiceChipInputWidgetScreen.smallBodySelectors,
          labels: smallBodySelectorLabels,
          keys: ChoiceChipInputWidgetScreen.smallBodySelectorKeys,
          selected: selector3,
          textList: textList3,
          textFieldWidth: 200,
          textFieldTextAlign: TextAlign.start,
          spacing: ChoiceChipInputWidget.defaultSpacing * 1.5,
          onStateChanged: (value, textList) {
            setState(() {
              selector3 = value;
              textList3 = textList;
            });
          },
        ),
      ),
    );
  }

  Widget _getDemo4({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'expectNoOverflow()',
      demoWidget: SizedBox(
        width: DeviceDimensions.galaxyFoldPortraitWidth -
            (HrkDimensions.pageMarginHorizontal * 2),
        child: BodyItemContainer(
          child: ChoiceChipInputWidget<StudentSelector>(
            key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
            keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
            title: l10n.demoIndex(demoIndex),
            values: ChoiceChipInputWidgetScreen.studentSelectors,
            labels: studentSelectorLabels,
            keys: ChoiceChipInputWidgetScreen.studentSelectorKeys,
            selected: selector4,
            textList: textList4,
            onStateChanged: (value, textList) {
              setState(() {
                selector4 = value;
                textList4 = textList;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _getDemo5({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Disabled',
      demoWidget: BodyItemContainer(
        child: ChoiceChipInputWidget<SmallBodySelector>(
          key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
          title: l10n.demoIndex(demoIndex),
          values: ChoiceChipInputWidgetScreen.smallBodySelectors,
          labels: smallBodySelectorLabels,
          keys: ChoiceChipInputWidgetScreen.smallBodySelectorKeys,
          selected: selector5,
          textList: textList5,
          enabled: false,
          onStateChanged: (value, textList) {
            setState(() {
              selector5 = value;
              textList5 = textList;
            });
          },
        ),
      ),
    );
  }

  Widget _getDemo6({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'disableInputs',
      demoWidget: BodyItemContainer(
        child: ChoiceChipInputWidget<SmallBodySelector>(
          key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
          title: l10n.demoIndex(demoIndex),
          values: ChoiceChipInputWidgetScreen.smallBodySelectors,
          labels: smallBodySelectorLabels,
          keys: ChoiceChipInputWidgetScreen.smallBodySelectorKeys,
          selected: selector6,
          textList: textList6,
          disableInputs: true,
          onStateChanged: (value, textList) {
            setState(() {
              selector6 = value;
              textList6 = textList;
            });
          },
        ),
      ),
    );
  }

  Widget _getDemo7({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: '1 ChoiceChip',
      demoWidget: BodyItemContainer(
        child: ChoiceChipInputWidget<SmallBodySelector>(
          key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
          title: l10n.demoIndex(demoIndex),
          values: {ChoiceChipInputWidgetScreen.smallBodySelectors.first},
          labels: {smallBodySelectorLabels.first},
          keys: {ChoiceChipInputWidgetScreen.smallBodySelectorKeys.first},
          selected: selector7,
          textList: textList7,
          onStateChanged: (value, textList) {
            setState(() {
              selector7 = value;
              textList7 = textList;
            });
          },
        ),
      ),
    );
  }

  Widget _getDemo8({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Empty title, 0 ChoiceChip',
      demoWidget: ChoiceChipInputWidget<SmallBodySelector>(
        key: ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
        keyPrefix: ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex),
        title: '',
        values: const {},
        labels: const {},
        selected: selector8,
        textList: textList8,
        onStateChanged: (value, textList) {
          setState(() {
            selector8 = value;
            textList8 = textList;
          });
        },
      ),
    );
  }
}
