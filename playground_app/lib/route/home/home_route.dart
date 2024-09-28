import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../constants/labels.dart';
import '../about/about_route.dart';
import '../about/license/license_route.dart';
import '../choice_chip_group/choice_chip_group_route.dart';
import '../choice_chip_input_widget/choice_chip_input_widget_route.dart';
import '../date_range_widget/date_range_widget_route.dart';
import '../filter_chip_group/filter_chip_group_route.dart';
import '../label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';
import '../label_value_wrap/label_value_wrap_route.dart';
import '../settings/settings_route.dart';
import 'home_screen.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.pathSegment,
  name: HomeRoute.displayName,
  routes: [
    TypedGoRoute<SettingsRoute>(
      path: SettingsRoute.pathSegment,
      name: SettingsRoute.displayName,
    ),
    TypedGoRoute<AboutRoute>(
      path: AboutRoute.pathSegment,
      name: AboutRoute.displayName,
      routes: [
        TypedGoRoute<LicenseRoute>(
          path: LicenseRoute.pathSegment,
          name: LicenseRoute.displayName,
        )
      ],
    ),
    TypedGoRoute<ChoiceChipInputWidgetRoute>(
      path: ChoiceChipInputWidgetRoute.pathSegment,
      name: ChoiceChipInputWidgetRoute.displayName,
    ),
    TypedGoRoute<DateRangeWidgetRoute>(
      path: DateRangeWidgetRoute.pathSegment,
      name: DateRangeWidgetRoute.displayName,
    ),
    TypedGoRoute<ChoiceChipGroupRoute>(
      path: ChoiceChipGroupRoute.pathSegment,
      name: ChoiceChipGroupRoute.displayName,
    ),
    TypedGoRoute<FilterChipGroupRoute>(
      path: FilterChipGroupRoute.pathSegment,
      name: FilterChipGroupRoute.displayName,
    ),
    TypedGoRoute<LabelLinkInkWellWrapRoute>(
      path: LabelLinkInkWellWrapRoute.pathSegment,
      name: LabelLinkInkWellWrapRoute.displayName,
    ),
    TypedGoRoute<LabelValueWrapRoute>(
      path: LabelValueWrapRoute.pathSegment,
      name: LabelValueWrapRoute.displayName,
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const String pathSegment = '/';
  static final Uri uri = Uri(path: pathSegment);
  static const String displayName = Labels.playgroundApp;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final l10n = AppLocalizations.of(context);
    return HomeScreen(
      title: l10n.playgroundApp,
      l10n: l10n,
    );
  }
}
