import 'package:flutter/material.dart';

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
    find.byKey(FilterChipGroupScreen.getDemoKey(demoIndex)),
    customScrollViewFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
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
