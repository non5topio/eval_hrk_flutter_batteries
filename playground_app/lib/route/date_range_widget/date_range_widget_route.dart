import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import '../../constants/labels.dart';
import '../../deferred_loading/deferred_loading.dart';
import 'date_range_widget_screen.dart' deferred as date_range_widget_screen;

class DateRangeWidgetRoute extends GoRouteData {
  const DateRangeWidgetRoute({
    this.$extra,
  });

  final JsonMap? $extra;

  static const String pathSegment = 'date-range-widget';
  static final Uri uri = Uri(path: '/$pathSegment');
  static const String displayName = Labels.dateRangeWidgetCN;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final l10n = AppLocalizations.of(context);
    const title = displayName;
    return DeferredWidget(
      date_range_widget_screen.loadLibrary,
      () => date_range_widget_screen.DateRangeWidgetScreen(
        title: title,
        l10n: l10n,
      ),
      placeholder: const DeferredPlaceholderWidget(
        title: title,
      ),
    );
  }
}
