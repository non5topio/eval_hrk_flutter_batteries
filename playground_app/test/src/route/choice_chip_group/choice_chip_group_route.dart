import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:playground_app/route/choice_chip_group/choice_chip_group_route.dart';
import 'package:playground_app/route/choice_chip_group/choice_chip_group_screen.dart';
import '../../playground_app.dart';

final Finder customScrollViewKeyFinder =
    find.byKey(ChoiceChipGroupScreen.customScrollViewKey);

Future<void> pumpChoiceChipGroupRoute(
  WidgetTester tester,
) async {
  await pumpApp(tester, initialLocation: ChoiceChipGroupRoute.uri.path);
}

Future<void> ensureDemoVisible(WidgetTester tester, int index) async {
  await tester.dragUntilVisible(
    find.byKey(ChoiceChipGroupScreen.getDemoKey(index)),
    customScrollViewKeyFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

Finder getChipFindersOf(int index) {
  return find.descendant(
    of: find.byKey(ChoiceChipGroupScreen.getDemoKey(index)),
    matching: find.byType(ChoiceChip),
  );
}
