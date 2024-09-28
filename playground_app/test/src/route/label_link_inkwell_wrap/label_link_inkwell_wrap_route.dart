// ignore_for_file: directives_ordering

import 'package:flutter/widgets.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';
import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_screen.dart';
import '../../playground_app.dart';

final Finder listViewFinder =
    find.byKey(LabelLinkInkWellWrapScreen.listViewKey);

Future<void> pumpLabelLinkInkWellWrapRoute(
  WidgetTester tester,
) async {
  await pumpApp(tester, initialLocation: LabelLinkInkWellWrapRoute.uri.path);
}

Future<void> ensureDemoVisible(WidgetTester tester, int demoIndex) async {
  await tester.dragUntilVisible(
    find.byKey(LabelLinkInkWellWrapScreen.getDemoScaffoldKey(demoIndex)),
    listViewFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

Finder getHeaderFinder(int demoIndex) {
  return find.byKey(LabelLinkInkWellWrapScreen.getDemoHeaderKey(demoIndex));
}

void expectHeaderContainsDescription(WidgetTester tester, int demoIndex) {
  final headerFinder = getHeaderFinder(demoIndex);
  final headerText = tester.widget<Text>(headerFinder);
  check(headerText.data!).contains(tester.testDescription);
}
