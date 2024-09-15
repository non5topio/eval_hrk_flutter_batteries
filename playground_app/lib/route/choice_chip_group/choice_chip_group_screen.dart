import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_logging/hrk_logging.dart';
import 'package:hrk_nasa_apis/hrk_nasa_apis.dart';

import '../../globals.dart';
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
  static final int defaultSelectionIndex = ChoiceChipGroupScreen
      .closeApproachBodySet
      .toList()
      .indexOf(ChoiceChipGroupScreen.defaultSelection);
  final Set<String> demoKeys =
      ChoiceChipGroupScreen.closeApproachBodySet.map((e) => e.name).toSet();
  // ignore: unused_field
  final _logger = Logger('$appNamePascalCase.ChoiceChipGroupScreen');
  static const String keyPrefix = 'choice_chip_group_screen_';
  static const Key customScrollViewKey = Key('${keyPrefix}scroll_view_key');
  static const String demoKeyPrefix = '${keyPrefix}demo_';

  @override
  State<ChoiceChipGroupScreen> createState() => _ChoiceChipGroupScreenState();

  static String getDemoKeyPrefix(int index) {
    return '$demoKeyPrefix${index}_';
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

  @override
  void initState() {
    super.initState();
    demo3Selection = ChoiceChipGroupScreen.defaultSelection;
    demo4Selection = ChoiceChipGroupScreen.defaultSelection;
    demo5Selection = ChoiceChipGroupScreen.defaultSelection;
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
    return [
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      ),
      _getDemo0(context: context),
      _getDemo1(context: context),
      _getDemo2(context: context),
      _getDemo3(context: context),
      _getDemo4(context: context),
      _getDemo5(context: context),
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      )
    ];
  }

  // Just group, no title
  Widget _getDemo0({required BuildContext context}) {
    int demoIndex = 0;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: ChoiceChipGroup<CloseApproachBody>(
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
      ),
    );
  }

  // Title, No container
  Widget _getDemo1({required BuildContext context}) {
    int demoIndex = 1;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: SizedBox(
            width: HrkDimensions.bodyItemContentWidth,
            child: ChoiceChipGroup<CloseApproachBody>(
              key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
              keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demo1,
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
        ),
      ),
    );
  }

  // With BodyItemContainer
  Widget _getDemo2({required BuildContext context}) {
    int demoIndex = 2;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: ChoiceChipGroup<CloseApproachBody>(
              key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
              keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demo2,
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
        ),
      ),
    );
  }

  // Default selection
  Widget _getDemo3({required BuildContext context}) {
    int demoIndex = 3;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: ChoiceChipGroup<CloseApproachBody>(
              key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
              keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demo3,
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
        ),
      ),
    );
  }

  // Disabled
  Widget _getDemo4({required BuildContext context}) {
    int demoIndex = 4;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: ChoiceChipGroup<CloseApproachBody>(
              key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
              keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
              enabled: false,
              title: widget.l10n.demo4,
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
      ),
    );
  }

  // Disabled inputs
  Widget _getDemo5({required BuildContext context}) {
    int demoIndex = 5;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: ChoiceChipGroup<CloseApproachBody>(
              key: ChoiceChipGroupScreen.getDemoKey(demoIndex),
              keyPrefix: ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demo5,
              values: ChoiceChipGroupScreen.closeApproachBodySet,
              labels: widget.demoLabels,
              keys: widget.demoKeys,
              selected: demo5Selection,
              disableInputs: true,
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
        ),
      ),
    );
  }
}
