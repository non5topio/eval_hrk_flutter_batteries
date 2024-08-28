import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import '../../constants/labels.dart';
import '../../deferred_loading/deferred_loading.dart';

import 'label_link_inkwell_wrap_screen.dart'
    deferred as label_link_inkwell_wrap;

class LabelLinkInkWellWrapRoute extends GoRouteData {
  const LabelLinkInkWellWrapRoute({
    this.$extra,
  });

  final JsonMap? $extra;

  static const String pathSegment = 'label-link-inkwell-wrap';
  static final Uri uri = Uri(path: '/$pathSegment');
  static const String displayName = Labels.labelLinkInkwellWrap;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final l10n = AppLocalizations.of(context);
    const title = displayName;
    return DeferredWidget(
      label_link_inkwell_wrap.loadLibrary,
      () => label_link_inkwell_wrap.LabelLinkInkWellWrapScreen(
        title: title,
        l10n: l10n,
      ),
      placeholder: const DeferredPlaceholderWidget(
        title: title,
      ),
    );
  }
}
