import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_nasa_apis/hrk_nasa_apis.dart';

import '../../widgets/app_bar.dart';

class ChoiceChipGroupScreen extends StatefulWidget {
  ChoiceChipGroupScreen({
    super.key,
    required this.title,
    required this.l10n,
    this.routeExtraMap,
  }) {
    demoLabels = {
      l10n.earth,
      l10n.moon,
      l10n.all,
      l10n.mercury,
      l10n.venus,
      l10n.mars,
      l10n.jupiter,
      l10n.saturn,
      l10n.uranus,
      l10n.neptune,
      l10n.pluto,
    };
  }

  final String title;
  final AppLocalizations l10n;
  final JsonMap? routeExtraMap;
  late final Set<String> demoLabels;
  static final Set<CloseApproachBody> closeApproachBodySet = {
    CloseApproachBody.earth,
    CloseApproachBody.moon,
    CloseApproachBody.all,
    CloseApproachBody.mercury,
    CloseApproachBody.venus,
    CloseApproachBody.mars,
    CloseApproachBody.jupiter,
    CloseApproachBody.saturn,
    CloseApproachBody.uranus,
    CloseApproachBody.neptune,
    CloseApproachBody.pluto,
  };
  static const CloseApproachBody defaultSelection = CloseApproachBody.all;
  static final int defaultSelectionIndex =
      closeApproachBodySet.toList().indexOf(defaultSelection);
  final Set<String> demoKeys = closeApproachBodySet.map((e) => e.name).toSet();
  static const String keyPrefix = 'choice_chip_group_screen_';
  static const Key customScrollViewKey = Key('${keyPrefix}scroll_view_key');
  static const String demoKeyPrefix = '${keyPrefix}demo_';

  @override
  State<ChoiceChipGroupScreen> createState() => _ChoiceChipGroupScreenState();

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

class _ChoiceChipGroupScreenState extends State<ChoiceChipGroupScreen> {
  CloseApproachBody? demo0Selection;
  CloseApproachBody? demo1Selection;
  CloseApproachBody? demo2Selection;
  CloseApproachBody? demo3Selection;
  CloseApproachBody? demo4Selection;
  CloseApproachBody? demo5Selection;
  CloseApproachBody? demo6Selection;
  CloseApproachBody? demo7Selection;
  CloseApproachBody? demo8Selection;

  @override
  void initState() {
    super.initState();
    demo3Selection = ChoiceChipGroupScreen.defaultSelection;
    demo4Selection = ChoiceChipGroupScreen.defaultSelection;
    demo5Selection = ChoiceChipGroupScreen.defaultSelection;
    demo6Selection = ChoiceChipGroupScreen.defaultSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context: context),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  Widget _getBody({required BuildContext context}) {
    return CustomScrollView(
      key: ChoiceChipGroupScreen.customScrollViewKey,
      controller: ScrollController(),
      slivers: [
        getSliverAppBar(
          context: context,
          title: Tooltip(
            message: widget.title,
            child: Text(widget.title),
          ),
          floating: true,
          snap: true,
        ),
        ..._getSliverBody(context: context),
      ],
    );
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
      key: ChoiceChipGroupScreen.getDemoScaffoldKey(demoIndex),
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Text(
              demoHeader,
              key: ChoiceChipGroupScreen.getDemoHeaderKey(demoIndex),
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
      demoWidget: ChoiceChipGroup<CloseApproachBody>(
        key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
        keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
        values: ChoiceChipGroupScreen.closeApproachBodySet,
        labels: widget.demoLabels,
        keys: widget.demoKeys,
        selected: demo0Selection,
        onChipSelected: (closeApproachBody) {
          setState(() {
            demo0Selection = closeApproachBody;
          });
        },
      ),
    );
  }

  Widget _getDemo1({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'title, wrapped',
      demoWidget: SizedBox(
        width: HrkDimensions.bodyItemContentWidth,
        child: ChoiceChipGroup<CloseApproachBody>(
          key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: ChoiceChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selected: demo1Selection,
          onChipSelected: (closeApproachBody) {
            setState(() {
              demo1Selection = closeApproachBody;
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
      demoHeader: 'BodyItemContainer',
      demoWidget: BodyItemContainer(
        child: ChoiceChipGroup<CloseApproachBody>(
          key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: ChoiceChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selected: demo2Selection,
          onChipSelected: (closeApproachBody) {
            setState(() {
              demo2Selection = closeApproachBody;
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
      demoHeader: 'Default selected',
      demoWidget: BodyItemContainer(
        child: ChoiceChipGroup<CloseApproachBody>(
          key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: ChoiceChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selected: demo3Selection,
          onChipSelected: (closeApproachBody) {
            setState(() {
              if (closeApproachBody == null) {
                demo3Selection = ChoiceChipGroupScreen.defaultSelection;
              } else {
                demo3Selection = closeApproachBody;
              }
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
          child: ChoiceChipGroup<CloseApproachBody>(
            key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
            keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
            title: widget.l10n.demoIndex(demoIndex),
            values: ChoiceChipGroupScreen.closeApproachBodySet,
            labels: widget.demoLabels,
            keys: widget.demoKeys,
            selected: demo4Selection,
            onChipSelected: (closeApproachBody) {
              setState(() {
                if (closeApproachBody == null) {
                  demo4Selection = ChoiceChipGroupScreen.defaultSelection;
                } else {
                  demo4Selection = closeApproachBody;
                }
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
        child: ChoiceChipGroup<CloseApproachBody>(
          key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
          enabled: false,
          title: widget.l10n.demoIndex(demoIndex),
          values: ChoiceChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selected: demo5Selection,
          onChipSelected: (closeApproachBody) {
            setState(() {
              if (closeApproachBody == null) {
                demo5Selection = ChoiceChipGroupScreen.defaultSelection;
              } else {
                demo5Selection = closeApproachBody;
              }
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
        child: ChoiceChipGroup<CloseApproachBody>(
          key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: ChoiceChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selected: demo6Selection,
          disableInputs: true,
          onChipSelected: (closeApproachBody) {
            setState(() {
              if (closeApproachBody == null) {
                demo6Selection = ChoiceChipGroupScreen.defaultSelection;
              } else {
                demo6Selection = closeApproachBody;
              }
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
        child: ChoiceChipGroup<CloseApproachBody>(
          key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: {ChoiceChipGroupScreen.closeApproachBodySet.first},
          labels: {widget.demoLabels.first},
          keys: {widget.demoKeys.first},
          selected: demo7Selection,
          onChipSelected: (closeApproachBody) {
            setState(() {
              demo7Selection = closeApproachBody;
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
      demoWidget: ChoiceChipGroup<CloseApproachBody>(
        key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
        keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
        title: '',
        values: const {},
        labels: const {},
        selected: demo8Selection,
        onChipSelected: (closeApproachBody) {
          setState(() {
            demo8Selection = closeApproachBody;
          });
        },
      ),
    );
  }
}
