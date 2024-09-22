import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import '../../../src/route/filter_chip_group/filter_chip_group_route.dart';

void main() {
  group('$FilterChipGroup Interaction Test', () {
    testWidgets('Demo 0, Basic', (tester) async {
      const int demoIndex = 0;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      var chipElements = chipFinders.evaluate().toList();
      final int firstRandomIndex = Random().nextInt(chipElements.length);
      var firstRandomChip = chipElements[firstRandomIndex].widget as FilterChip;
      int secondRandomIndex;
      do {
        secondRandomIndex = Random().nextInt(chipElements.length);
      } while (firstRandomIndex == secondRandomIndex);
      var secondRandomChip =
          chipElements[secondRandomIndex].widget as FilterChip;
      expect(firstRandomChip.selected, false);
      expect(secondRandomChip.selected, false);

      await tester.tap(find.byKey(firstRandomChip.key!));
      await tester.pump();
      chipElements = chipFinders.evaluate().toList();
      firstRandomChip = chipElements[firstRandomIndex].widget as FilterChip;
      secondRandomChip = chipElements[secondRandomIndex].widget as FilterChip;
      expect(firstRandomChip.selected, true);
      expect(secondRandomChip.selected, false);

      await tester.tap(find.byKey(secondRandomChip.key!));
      await tester.pump();
      chipElements = chipFinders.evaluate().toList();
      firstRandomChip = chipElements[firstRandomIndex].widget as FilterChip;
      secondRandomChip = chipElements[secondRandomIndex].widget as FilterChip;
      expect(firstRandomChip.selected, true);
      expect(secondRandomChip.selected, true);

      await tester.tap(find.byKey(firstRandomChip.key!));
      await tester.pump();
      chipElements = chipFinders.evaluate().toList();
      firstRandomChip = chipElements[firstRandomIndex].widget as FilterChip;
      secondRandomChip = chipElements[secondRandomIndex].widget as FilterChip;
      expect(firstRandomChip.selected, false);
      expect(secondRandomChip.selected, true);

      await tester.tap(find.byKey(secondRandomChip.key!));
      await tester.pump();
      chipElements = chipFinders.evaluate().toList();
      firstRandomChip = chipElements[firstRandomIndex].widget as FilterChip;
      secondRandomChip = chipElements[secondRandomIndex].widget as FilterChip;
      expect(firstRandomChip.selected, false);
      expect(secondRandomChip.selected, false);
    });

    testWidgets('Demo 6, disableInputs', (tester) async {
      const int demoIndex = 6;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      expect(chipFinders.hitTestable().evaluate().length, 0);
    });

    testWidgets('Demo 7, Unselect and select all', (tester) async {
      const int demoIndex = 7;
      await pumpFilterChipGroupRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      var chipElements = chipFinders.evaluate().toList();
      for (int i = 0; i < chipElements.length; i++) {
        var chip = chipElements[i].widget as FilterChip;
        expect(chip.selected, true);
        await tester.tap(find.byKey(chip.key!), warnIfMissed: false);
        await tester.pump();
        chip = tester.widget<FilterChip>(find.byKey(chip.key!));
        expect(chip.selected, false);
      }
      for (int i = 0; i < chipElements.length; i++) {
        var chip = chipElements[i].widget as FilterChip;
        await tester.tap(find.byKey(chip.key!), warnIfMissed: false);
        await tester.pump();
        chip = tester.widget<FilterChip>(find.byKey(chip.key!));
        expect(chip.selected, true);
      }
    });
  });
}
