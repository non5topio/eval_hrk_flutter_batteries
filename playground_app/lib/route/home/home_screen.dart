import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:url_launcher/link.dart';

import '../../constants/labels.dart';
import '../../globals.dart';
import '../../widgets/app_bar.dart';
import '../choice_chip_group/choice_chip_group_route.dart';
import '../choice_chip_input_widget/choice_chip_input_widget_route.dart';
import '../date_range_widget/date_range_widget_route.dart';
import '../filter_chip_group/filter_chip_group_route.dart';
import '../label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';
import '../label_value_wrap/label_value_wrap_route.dart';

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
      _getDemoButton(
        context: context,
        uri: ChoiceChipInputWidgetRoute.uri,
        label: Labels.choiceChipInputWidgetCN,
      ),
      _getDemoButton(
        context: context,
        uri: DateRangeWidgetRoute.uri,
        label: Labels.dateRangeWidgetCN,
      ),
      _getDemoButton(
        context: context,
        uri: ChoiceChipGroupRoute.uri,
        label: Labels.choiceChipGroupCN,
      ),
      _getDemoButton(
        context: context,
        uri: FilterChipGroupRoute.uri,
        label: Labels.filterChipGroupCN,
      ),
      _getDemoButton(
        context: context,
        uri: LabelLinkInkWellWrapRoute.uri,
        label: Labels.labelLinkInkwellWrapCN,
      ),
      _getDemoButton(
        context: context,
        uri: LabelValueWrapRoute.uri,
        label: Labels.labelValueWrapCN,
      ),
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      )
    ];
  }

  Widget _getDemoButton({
    required BuildContext context,
    required Uri uri,
    required String label,
  }) {
    final themeData = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: Link(
            uri: uri,
            builder: (context, followLink) {
              return FilledButton(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  context.go(uri.toString(), extra: getRouteExtraMap());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
