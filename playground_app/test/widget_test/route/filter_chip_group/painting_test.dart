import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/filter_chip_group/filter_chip_group_screen.dart';
import '../../../src/globals.dart';
import '../../../src/route/filter_chip_group/filter_chip_group_route.dart';

void main() {
  group('$FilterChipGroup Painting Test', () {
    testWidgets('Demo 0', (tester) async {
      const int index = 0;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      expect(find.text(l10n.demo0), findsNothing);
      final chipElements = getChipFindersOf(index).evaluate();
      expect(
        chipElements.length,
        FilterChipGroupScreen.closeApproachBodySet.length,
      );
    });

    testWidgets('Demo 1, wrapped', (tester) async {
      const int index = 1;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      expect(find.text(l10n.demo1), findsOne);
      final chipFinders = getChipFindersOf(index);
      final firstChipRect = tester.getRect(chipFinders.first);
      final lastChipRect = tester.getRect(chipFinders.last);
      expect(firstChipRect.top < lastChipRect.top, true);
    });

    testWidgets('Demo 3, default selected', (tester) async {
      const int index = 3;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      final chipElements = getChipFindersOf(index).evaluate().toList();
      for (int i = 0; i < chipElements.length; i++) {
        final chip = chipElements[i].widget as FilterChip;
        expect(
          chip.selected,
          FilterChipGroupScreen.defaultSelectionIndex.contains(i),
        );
      }
    });

    testWidgets('Demo 4, disabled', (tester) async {
      const int index = 4;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      final chipElements = getChipFindersOf(index).evaluate();
      for (final chipElement in chipElements) {
        final chip = chipElement.widget as FilterChip;
        expect(chip.isEnabled, false);
      }
    });
  });
}
