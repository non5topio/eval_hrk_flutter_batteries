import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/choice_chip_group/choice_chip_group_screen.dart';
import '../../../src/route/choice_chip_group/choice_chip_group_route.dart';

void main() {
  group('$ChoiceChipGroup Painting Test', () {
    testWidgets('Basic', (tester) async {
      const int demoIndex = 0;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsNothing);
      final chipElements = getChipFindersOf(demoIndex).evaluate();
      expect(
        chipElements.length,
        ChoiceChipGroupScreen.closeApproachBodySet.length,
      );
    });

    testWidgets('title, wrapped', (tester) async {
      const int demoIndex = 1;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsOne);
      final chipFinders = getChipFindersOf(demoIndex);
      final firstChipRect = tester.getRect(chipFinders.first);
      final lastChipRect = tester.getRect(chipFinders.last);
      expect(firstChipRect.top < lastChipRect.top, true);
    });

    testWidgets('Default selected', (tester) async {
      const int demoIndex = 3;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final chipElements = getChipFindersOf(demoIndex).evaluate();
      for (final (index, chipElement) in chipElements.indexed) {
        final chip = chipElement.widget as ChoiceChip;
        expect(
          chip.selected,
          index == ChoiceChipGroupScreen.defaultSelectionIndex,
        );
      }
    });

    testWidgets('expectNoOverflow()', (tester) async {
      const int demoIndex = 4;
      disableOverflowError();
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      tester.expectNoOverflow(
        of: find.byKey(ChoiceChipGroupScreen.getDemoKey(demoIndex)),
      );
    });

    testWidgets('Disabled', (tester) async {
      const int demoIndex = 5;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final chipElements = getChipFindersOf(demoIndex).evaluate();
      for (final chipElement in chipElements) {
        final chip = chipElement.widget as ChoiceChip;
        expect(chip.isEnabled, false);
      }
    });

    testWidgets('1 ChoiceChip', (tester) async {
      const int demoIndex = 7;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsOne);
      final chipElements = getChipFindersOf(demoIndex).evaluate();
      expect(chipElements.length, 1);
    });

    testWidgets('Empty title, 0 ChoiceChip', (tester) async {
      const int demoIndex = 8;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final demoRect = tester.getRect(find.byKey(
        ChoiceChipGroupScreen.getDemoKey(demoIndex),
      ));
      expect(demoRect.size, Size.zero);
    });
  });
}
