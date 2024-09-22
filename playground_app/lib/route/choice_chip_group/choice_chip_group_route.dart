import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import '../../constants/labels.dart';
import '../../deferred_loading/deferred_loading.dart';
import 'choice_chip_group_screen.dart' deferred as choice_chip_group_screen;

class ChoiceChipGroupRoute extends GoRouteData {
  const ChoiceChipGroupRoute({
    this.$extra,
  });

  final JsonMap? $extra;

  static const String pathSegment = 'choice-chip-group';
  static final Uri uri = Uri(path: '/$pathSegment');
  static const String displayName = Labels.choiceChipGroupCN;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final l10n = AppLocalizations.of(context);
    const title = displayName;
    return DeferredWidget(
      choice_chip_group_screen.loadLibrary,
      () => choice_chip_group_screen.ChoiceChipGroupScreen(
        title: title,
        l10n: l10n,
      ),
      placeholder: const DeferredPlaceholderWidget(
        title: title,
      ),
    );
  }
}
