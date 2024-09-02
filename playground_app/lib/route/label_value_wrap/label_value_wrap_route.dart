import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:intl/intl.dart';

import '../../constants/labels.dart';
import '../../deferred_loading/deferred_loading.dart';
import 'label_value_wrap_screen.dart' deferred as label_value_wrap;

class LabelValueWrapRoute extends GoRouteData {
  const LabelValueWrapRoute({
    this.$extra,
  });

  final JsonMap? $extra;

  static const String pathSegment = 'label-value-wrap';
  static final Uri uri = Uri(path: '/$pathSegment');
  static const String displayName = Labels.labelValueWrapCN;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final l10n = AppLocalizations.of(context);
    const title = displayName;
    final locale = Localizations.localeOf(context).toString();
    final zeroDigit = DateFormat(null, locale).dateSymbols.ZERODIGIT ?? '0';
    return DeferredWidget(
      label_value_wrap.loadLibrary,
      () => label_value_wrap.LabelValueWrapScreen(
        title: title,
        l10n: l10n,
        zeroDigit: zeroDigit,
      ),
      placeholder: const DeferredPlaceholderWidget(
        title: title,
      ),
    );
  }
}
