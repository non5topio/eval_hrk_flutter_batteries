import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_nasa_apis/hrk_nasa_apis.dart';

import '../../widgets/app_bar.dart';

class FilterChipGroupScreen extends StatefulWidget {
  FilterChipGroupScreen({
    super.key,
    required this.title,
    required this.l10n,
    this.routeExtraMap,
  }) {
    demoLabels = {
      l10n.mercury,
      l10n.venus,
      l10n.earth,
      l10n.moon,
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
    CloseApproachBody.mercury,
    CloseApproachBody.venus,
    CloseApproachBody.earth,
    CloseApproachBody.moon,
    CloseApproachBody.mars,
    CloseApproachBody.jupiter,
    CloseApproachBody.saturn,
    CloseApproachBody.uranus,
    CloseApproachBody.neptune,
    CloseApproachBody.pluto,
  };
  static const Set<CloseApproachBody> defaultSelectionSet = {
    CloseApproachBody.earth,
    CloseApproachBody.moon,
  };
  static final Set<int> defaultSelectionIndex = {
    ...defaultSelectionSet.map((e) {
      return closeApproachBodySet.toList().indexOf(e);
    }),
  };
  final Set<String> demoKeys = closeApproachBodySet.map((e) => e.name).toSet();
  static const String keyPrefix = 'filter_chip_group_screen_';
  static const Key customScrollViewKey = Key('${keyPrefix}scroll_view_key');
  static const String demoKeyPrefix = '${keyPrefix}demo_';

  @override
  State<FilterChipGroupScreen> createState() => _FilterChipGroupScreenState();

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

class _FilterChipGroupScreenState extends State<FilterChipGroupScreen> {
  Set<CloseApproachBody> demo0SelectionSet = {};
  Set<CloseApproachBody> demo1SelectionSet = {};
  Set<CloseApproachBody> demo2SelectionSet = {};
  Set<CloseApproachBody> demo3SelectionSet = {};
  Set<CloseApproachBody> demo4SelectionSet = {};
  Set<CloseApproachBody> demo5SelectionSet = {};
  Set<CloseApproachBody> demo6SelectionSet = {};
  Set<CloseApproachBody> demo7SelectionSet = {};
  Set<CloseApproachBody> demo8SelectionSet = {};
  Set<CloseApproachBody> demo9SelectionSet = {};

  @override
  void initState() {
    super.initState();
    demo3SelectionSet = Set.from(FilterChipGroupScreen.defaultSelectionSet);
    demo4SelectionSet = Set.from(FilterChipGroupScreen.defaultSelectionSet);
    demo5SelectionSet = Set.from(FilterChipGroupScreen.defaultSelectionSet);
    demo6SelectionSet = Set.from(FilterChipGroupScreen.closeApproachBodySet);
    demo7SelectionSet = Set.from(FilterChipGroupScreen.closeApproachBodySet);
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
      key: FilterChipGroupScreen.customScrollViewKey,
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
      _getDemo9(context: context, demoIndex: demoIndex++),
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
      key: FilterChipGroupScreen.getDemoScaffoldKey(demoIndex),
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Text(
              demoHeader,
              key: FilterChipGroupScreen.getDemoHeaderKey(demoIndex),
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
      demoWidget: FilterChipGroup<CloseApproachBody>(
        key: FilterChipGroupScreen.getDemoKey(demoIndex),
        keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
        values: FilterChipGroupScreen.closeApproachBodySet,
        labels: widget.demoLabels,
        keys: widget.demoKeys,
        selectedSet: demo0SelectionSet,
        onChipsSelected: (selectedSet) {
          setState(() {
            demo0SelectionSet = selectedSet;
          });
        },
      ),
    );
  }

  Widget _getDemo1({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'title, wrappped',
      demoWidget: SizedBox(
        width: HrkDimensions.bodyItemContentWidth,
        child: FilterChipGroup<CloseApproachBody>(
          key: FilterChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selectedSet: demo1SelectionSet,
          onChipsSelected: (selectedSet) {
            setState(() {
              demo1SelectionSet = selectedSet;
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
        child: FilterChipGroup<CloseApproachBody>(
          key: FilterChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selectedSet: demo2SelectionSet,
          onChipsSelected: (selectedSet) {
            setState(() {
              demo2SelectionSet = selectedSet;
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
        child: FilterChipGroup<CloseApproachBody>(
          key: FilterChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selectedSet: demo3SelectionSet,
          onChipsSelected: (selectedSet) {
            setState(() {
              demo3SelectionSet = selectedSet;
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
          child: FilterChipGroup<CloseApproachBody>(
            key: FilterChipGroupScreen.getDemoKey(demoIndex),
            keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
            title: widget.l10n.demoIndex(demoIndex),
            values: FilterChipGroupScreen.closeApproachBodySet,
            labels: widget.demoLabels,
            keys: widget.demoKeys,
            selectedSet: demo4SelectionSet,
            onChipsSelected: (selectedSet) {
              setState(() {
                demo4SelectionSet = selectedSet;
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
        child: FilterChipGroup<CloseApproachBody>(
          key: FilterChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
          enabled: false,
          title: widget.l10n.demoIndex(demoIndex),
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selectedSet: demo5SelectionSet,
          onChipsSelected: (selectedSet) {
            setState(() {
              demo5SelectionSet = selectedSet;
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
        child: FilterChipGroup<CloseApproachBody>(
          key: FilterChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selectedSet: demo6SelectionSet,
          disableInputs: true,
          onChipsSelected: (selectedSet) {
            setState(() {
              demo6SelectionSet = selectedSet;
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
      demoHeader: 'All selected',
      demoWidget: BodyItemContainer(
        child: FilterChipGroup<CloseApproachBody>(
          key: FilterChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: widget.demoLabels,
          keys: widget.demoKeys,
          selectedSet: demo7SelectionSet,
          onChipsSelected: (selectedSet) {
            setState(() {
              demo7SelectionSet = selectedSet;
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
      demoHeader: '1 FilterChip',
      demoWidget: BodyItemContainer(
        child: FilterChipGroup<CloseApproachBody>(
          key: FilterChipGroupScreen.getDemoKey(demoIndex),
          keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
          title: widget.l10n.demoIndex(demoIndex),
          values: {FilterChipGroupScreen.closeApproachBodySet.first},
          labels: {widget.demoLabels.first},
          keys: {widget.demoKeys.first},
          selectedSet: demo8SelectionSet,
          onChipsSelected: (selectedSet) {
            setState(() {
              demo8SelectionSet = selectedSet;
            });
          },
        ),
      ),
    );
  }

  Widget _getDemo9({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Empty title, 0 FilterChip',
      demoWidget: FilterChipGroup<CloseApproachBody>(
        key: FilterChipGroupScreen.getDemoKey(demoIndex),
        keyPrefix: FilterChipGroupScreen.getDemoKeyPrefix(demoIndex),
        title: '',
        values: const {},
        labels: const {},
        selectedSet: demo9SelectionSet,
        onChipsSelected: (selectedSet) {
          setState(() {
            demo9SelectionSet = selectedSet;
          });
        },
      ),
    );
  }
}
