// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/choice_chip_group/choice_chip_group_route.dart';
import 'package:playground_app/route/choice_chip_group/choice_chip_group_screen.dart';
import '../../playground_app.dart';

final Finder customScrollViewFinder =
    find.byKey(ChoiceChipGroupScreen.customScrollViewKey);

Future<void> pumpChoiceChipGroupRoute(
  WidgetTester tester,
) async {
  await pumpApp(tester, initialLocation: ChoiceChipGroupRoute.uri.path);
}

Future<void> ensureDemoVisible(WidgetTester tester, int demoIndex) async {
  await tester.dragUntilVisible(
    find.byKey(ChoiceChipGroupScreen.getDemoScaffoldKey(demoIndex)),
    customScrollViewFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

Finder getHeaderFinder(int demoIndex) {
  return find.byKey(ChoiceChipGroupScreen.getDemoHeaderKey(demoIndex));
}

void expectHeaderContainsDescription(WidgetTester tester, int demoIndex) {
  final headerFinder = getHeaderFinder(demoIndex);
  final headerText = tester.widget<Text>(headerFinder);
  check(headerText.data!).contains(tester.testDescription);
}

Finder getTitleFinder(int demoIndex) {
  return find.byKey(Key(
    '${ChoiceChipGroupScreen.getDemoKeyPrefix(demoIndex)}'
    '${ChoiceChipGroup.titleKey}',
  ));
}

Finder getChipFindersOf(int demoIndex) {
  return find.descendant(
    of: find.byKey(ChoiceChipGroupScreen.getDemoKey(demoIndex)),
    matching: find.byType(ChoiceChip),
  );
}
