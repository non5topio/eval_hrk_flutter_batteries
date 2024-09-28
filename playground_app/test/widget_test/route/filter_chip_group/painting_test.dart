import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/filter_chip_group/filter_chip_group_screen.dart';
import '../../../src/route/filter_chip_group/filter_chip_group_route.dart';

void main() {
  group('$FilterChipGroup Painting Test', () {
    testWidgets('Basic', (tester) async {
      const int demoIndex = 0;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsNothing);
      final chipElements = getChipFindersOf(demoIndex).evaluate();
      expect(
        chipElements.length,
        FilterChipGroupScreen.closeApproachBodySet.length,
      );
    });

    testWidgets('title, wrappped', (tester) async {
      const int demoIndex = 1;
      await pumpFilterChipGroupRoute(tester);
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
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final chipElements = getChipFindersOf(demoIndex).evaluate().toList();
      for (int i = 0; i < chipElements.length; i++) {
        final chip = chipElements[i].widget as FilterChip;
        expect(
          chip.selected,
          FilterChipGroupScreen.defaultSelectionIndex.contains(i),
        );
      }
    });

    testWidgets('expectNoOverflow()', (tester) async {
      const int demoIndex = 4;
      disableOverflowError();
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      tester.expectNoOverflow(
        of: find.byKey(FilterChipGroupScreen.getDemoKey(demoIndex)),
      );
    });

    testWidgets('Disabled', (tester) async {
      const int demoIndex = 5;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final chipElements = getChipFindersOf(demoIndex).evaluate();
      for (final chipElement in chipElements) {
        final chip = chipElement.widget as FilterChip;
        expect(chip.isEnabled, false);
      }
    });

    testWidgets('1 FilterChip', (tester) async {
      const int demoIndex = 8;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsOne);
      final chipElements = getChipFindersOf(demoIndex).evaluate();
      expect(chipElements.length, 1);
    });

    testWidgets('Empty title, 0 FilterChip', (tester) async {
      const int demoIndex = 9;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final demoRect = tester.getRect(find.byKey(
        FilterChipGroupScreen.getDemoKey(demoIndex),
      ));
      expect(demoRect.size, Size.zero);
    });
  });
}
