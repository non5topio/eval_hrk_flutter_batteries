import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/choice_chip_group/choice_chip_group_screen.dart';
import '../../../src/globals.dart';
import '../../../src/route/choice_chip_group/choice_chip_group_route.dart';

void main() {
  group('$ChoiceChipGroup Painting Test', () {
    testWidgets('Demo 0', (tester) async {
      const int index = 0;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      expect(find.text(l10n.demo0), findsNothing);
      final chipElements = getChipFindersOf(index).evaluate();
      expect(
        chipElements.length,
        ChoiceChipGroupScreen.closeApproachBodySet.length,
      );
    });

    testWidgets('Demo 1, wrapped', (tester) async {
      const int index = 1;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      expect(find.text(l10n.demo1), findsOne);
      final chipFinders = getChipFindersOf(index);
      final firstChipRect = tester.getRect(chipFinders.first);
      final lastChipRect = tester.getRect(chipFinders.last);
      expect(firstChipRect.top < lastChipRect.top, true);
    });

    testWidgets('Demo 3, default selected', (tester) async {
      const int index = 3;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      final chipElements = getChipFindersOf(index).evaluate();
      for (final (index, chipElement) in chipElements.indexed) {
        final chip = chipElement.widget as ChoiceChip;
        expect(
          chip.selected,
          index == ChoiceChipGroupScreen.defaultSelectionIndex,
        );
      }
    });

    testWidgets('Demo 4, disabled', (tester) async {
      const int index = 4;
      await pumpChoiceChipGroupRoute(tester);
      await ensureDemoVisible(tester, index);
      final chipElements = getChipFindersOf(index).evaluate();
      for (final chipElement in chipElements) {
        final chipWidget = chipElement.widget as ChoiceChip;
        expect(chipWidget.isEnabled, false);
      }
    });
  });
}
