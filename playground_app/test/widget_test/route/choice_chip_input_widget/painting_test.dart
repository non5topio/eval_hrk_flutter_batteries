import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/choice_chip_input_widget/choice_chip_input_widget_screen.dart';
import '../../../src/extension/finder_result.dart';
import '../../../src/route/choice_chip_input_widget/choice_chip_input_widget_route.dart';

void main() {
  group('$ChoiceChipInputWidget Painting Test', () {
    testWidgets('Basic', (tester) async {
      const int demoIndex = 0;
      const selector = ChoiceChipInputWidgetScreen.smallBodySelectors;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsNothing);
      final textFieldRect = tester.getRect(getTextFieldFinder(demoIndex));
      expect(textFieldRect.width, ChoiceChipInputWidget.defaultTextFieldWidth);
      final textField = tester.widget<TextField>(getTextFieldFinder(demoIndex));
      expect(textField.textAlign, ChoiceChipInputWidget.defaultTextAlign);
      final chipFinders = getChipFindersOf(demoIndex);
      final chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips.length, selector.length);
      final chip0Rect = tester.getRect(find.byKey(chips[0].key!));
      final chip1Rect = tester.getRect(find.byKey(chips[1].key!));
      const spacing = ChoiceChipInputWidget.defaultSpacing;
      expect(chip1Rect.left - chip0Rect.right, spacing);
      expect(textFieldRect.top - chip0Rect.bottom, spacing * 2);
      expect(chips[0].selected, false);
      expect(chips[1].selected, false);
      expect(textField.enabled, false);
    });

    testWidgets('title', (tester) async {
      const int demoIndex = 1;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsOne);
    });

    testWidgets('3 ChoiceChips', (tester) async {
      const int demoIndex = 2;
      const selector = ChoiceChipInputWidgetScreen.studentSelectors;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      final chips = chipFinders.evaluate().toList();
      expect(chips.length, selector.length);
    });

    testWidgets('textFieldWidth, textFieldTextAlign, spacing', (tester) async {
      const int demoIndex = 3;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final textFieldRect = tester.getRect(getTextFieldFinder(demoIndex));
      expect(textFieldRect.width, 200);
      final textField = tester.widget<TextField>(getTextFieldFinder(demoIndex));
      expect(textField.textAlign, TextAlign.start);
      final chipFinders = getChipFindersOf(demoIndex);
      final chips = chipFinders.evaluate().toList();
      final chip0Rect = tester.getRect(find.byKey(chips[0].widget.key!));
      final chip1Rect = tester.getRect(find.byKey(chips[1].widget.key!));
      const spacing = ChoiceChipInputWidget.defaultSpacing * 1.5;
      expect(chip1Rect.left - chip0Rect.right, spacing);
      expect(textFieldRect.top - chip0Rect.bottom, spacing * 2);
    });

    testWidgets('expectNoOverflow()', (tester) async {
      const int demoIndex = 4;
      disableOverflowError();
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      tester.expectNoOverflow(
        of: find.byKey(ChoiceChipInputWidgetScreen.getDemoKey(demoIndex)),
      );
    });

    testWidgets('Disabled', (tester) async {
      const int demoIndex = 5;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final chips = getChipFindersOf(demoIndex).evaluate().toList();
      for (int i = 0; i < chips.length; i++) {
        final chip = chips[i].widget as ChoiceChip;
        expect(chip.isEnabled, false);
      }
      final textField = tester.widget<TextField>(getTextFieldFinder(demoIndex));
      expect(textField.enabled, false);
    });

    testWidgets('1 ChoiceChip', (tester) async {
      const int demoIndex = 7;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsOne);
      final chipFinders = getChipFindersOf(demoIndex);
      final chips = chipFinders.evaluate().toList();
      expect(chips.length, 1);
    });

    testWidgets('Empty title, 0 ChoiceChip', (tester) async {
      const int demoIndex = 8;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final demoRect = tester.getRect(find.byKey(
        ChoiceChipInputWidgetScreen.getDemoKey(demoIndex),
      ));
      expect(demoRect.size, Size.zero);
    });
  });
}
