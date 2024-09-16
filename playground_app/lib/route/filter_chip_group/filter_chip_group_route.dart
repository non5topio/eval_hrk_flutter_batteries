import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import '../../constants/labels.dart';
import '../../deferred_loading/deferred_loading.dart';
import 'filter_chip_group_screen.dart' deferred as filter_chip_group;

class FilterChipGroupRoute extends GoRouteData {
  const FilterChipGroupRoute({
    this.$extra,
  });

  final JsonMap? $extra;

  static const String pathSegment = 'filter-chip-group';
  static final Uri uri = Uri(path: '/$pathSegment');
  static const String displayName = Labels.filterChipGroupCN;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final l10n = AppLocalizations.of(context);
    const title = displayName;
    return DeferredWidget(
      filter_chip_group.loadLibrary,
      () => filter_chip_group.FilterChipGroupScreen(
        title: title,
        l10n: l10n,
      ),
      placeholder: const DeferredPlaceholderWidget(
        title: title,
      ),
    );
  }
}
