// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/filter_chip_group/filter_chip_group_route.dart';
import 'package:playground_app/route/filter_chip_group/filter_chip_group_screen.dart';
import '../../playground_app.dart';

final Finder customScrollViewFinder =
    find.byKey(FilterChipGroupScreen.customScrollViewKey);

Future<void> pumpFilterChipGroupRoute(
  WidgetTester tester,
) async {
  await pumpApp(tester, initialLocation: FilterChipGroupRoute.uri.path);
}

Future<void> ensureDemoVisible(WidgetTester tester, int demoIndex) async {
  await tester.dragUntilVisible(
    find.byKey(FilterChipGroupScreen.getDemoScaffoldKey(demoIndex)),
    customScrollViewFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

Finder getHeaderFinder(int demoIndex) {
  return find.byKey(FilterChipGroupScreen.getDemoHeaderKey(demoIndex));
}

void expectHeaderContainsDescription(WidgetTester tester, int demoIndex) {
  final headerFinder = getHeaderFinder(demoIndex);
  final headerText = tester.widget<Text>(headerFinder);
  check(headerText.data!).contains(tester.testDescription);
}

Finder getTitleFinder(int demoIndex) {
  return find.byKey(Key(
    '${FilterChipGroupScreen.getDemoKeyPrefix(demoIndex)}'
    '${FilterChipGroup.titleKey}',
  ));
}

Finder getChipFindersOf(int demoIndex) {
  return find.descendant(
    of: find.byKey(FilterChipGroupScreen.getDemoKey(demoIndex)),
    matching: find.byType(FilterChip),
  );
}
