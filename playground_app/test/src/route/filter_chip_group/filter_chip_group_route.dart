import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:playground_app/route/filter_chip_group/filter_chip_group_route.dart';
import 'package:playground_app/route/filter_chip_group/filter_chip_group_screen.dart';
import '../../playground_app.dart';

final Finder customScrollViewKeyFinder =
    find.byKey(FilterChipGroupScreen.customScrollViewKey);

Future<void> pumpFilterChipGroupRoute(
  WidgetTester tester,
) async {
  await pumpApp(tester, initialLocation: FilterChipGroupRoute.uri.path);
}

Future<void> ensureDemoVisible(WidgetTester tester, int index) async {
  await tester.dragUntilVisible(
    find.byKey(FilterChipGroupScreen.getDemoKey(index)),
    customScrollViewKeyFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

Finder getChipFindersOf(int index) {
  return find.descendant(
    of: find.byKey(FilterChipGroupScreen.getDemoKey(index)),
    matching: find.byType(FilterChip),
  );
}
