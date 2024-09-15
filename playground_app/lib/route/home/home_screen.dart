import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:url_launcher/link.dart';

import '../../constants/labels.dart';
import '../../globals.dart';
import '../../widgets/app_bar.dart';
import '../choice_chip_group/choice_chip_group_route.dart';
import '../label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';
import '../label_value_wrap/label_value_wrap_route.dart';
import 'home_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.title,
    required this.l10n,
  });

  final String title;
  final AppLocalizations l10n;
  static const String keyPrefix = 'home_screen_';
  static const Key customScrollViewKey = Key('${keyPrefix}scroll_view_key');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context: context),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  Widget _getBody({required BuildContext context}) {
    return CustomScrollView(
      key: customScrollViewKey,
      controller: ScrollController(),
      slivers: [
        getSliverAppBar(
          context: context,
          title: Tooltip(
            message: title,
            child: Text(title),
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
      _getChoiceChipGroup(context: context),
      _getLabelLinkInkWellWrap(context: context),
      _getLabelValueWrap(context: context),
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      )
    ];
  }

  Widget _getChoiceChipGroup({required BuildContext context}) {
    final themeData = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: Link(
            uri: ChoiceChipGroupRoute.uri,
            builder: (context, followLink) {
              return FilledButton(
                child: Text(
                  Labels.choiceChipGroupCN,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  ChoiceChipGroupRoute($extra: getRouteExtraMap()).go(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getLabelLinkInkWellWrap({required BuildContext context}) {
    final themeData = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: Link(
            uri: LabelLinkInkWellWrapRoute.uri,
            builder: (context, followLink) {
              return FilledButton(
                child: Text(
                  Labels.labelLinkInkwellWrapCN,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  LabelLinkInkWellWrapRoute($extra: getRouteExtraMap())
                      .go(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getLabelValueWrap({required BuildContext context}) {
    final themeData = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: Link(
            uri: LabelValueWrapRoute.uri,
            builder: (context, followLink) {
              return FilledButton(
                child: Text(
                  Labels.labelValueWrapCN,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  LabelValueWrapRoute($extra: getRouteExtraMap()).go(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
