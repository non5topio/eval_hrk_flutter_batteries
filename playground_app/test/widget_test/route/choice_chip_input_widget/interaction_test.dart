import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/choice_chip_input_widget/choice_chip_input_widget_screen.dart';
import '../../../src/extension/finder_result.dart';
import '../../../src/route/choice_chip_input_widget/choice_chip_input_widget_route.dart';

void main() {
  group('$ChoiceChipInputWidget Interaction Test', () {
    tearDown(() {
      KeyboardVisibilityTesting.setVisibilityForTesting(false);
    });

    testWidgets('Demo 0, Basic', (tester) async {
      const int demoIndex = 0;
      const selector = ChoiceChipInputWidgetScreen.smallBodySelectors;
      await pumpChoiceChipInputWidgetRoute(tester);
      final screenState = tester.state<ChoiceChipInputWidgetScreenState>(
        find.byType(ChoiceChipInputWidgetScreen),
      );
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      List<ChoiceChip> chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(screenState.selector0, null);
      expect(screenState.textList0, ['', '']);

      await tapChip(tester, chips[0]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, true);
      expect(chips[1].selected, false);
      expect(screenState.selector0, selector.elementAt(0));
      final textFieldFinder = getTextFieldFinder(demoIndex);
      TextField textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, false);
      await tapTextField(tester, demoIndex);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, smallBodySpkId.toString());
      expect(screenState.textList0, [smallBodySpkId.toString(), '']);

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, true);
      expect(screenState.selector0, selector.elementAt(1));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, smallBodyDesignation);
      expect(
        screenState.textList0,
        [smallBodySpkId.toString(), smallBodyDesignation],
      );

      await tapTitle(tester, 1);
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.focusNode!.hasFocus, false);

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, false);
      expect(screenState.selector0, null);
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, false);
      expect(
        screenState.textList0,
        [smallBodySpkId.toString(), smallBodyDesignation],
      );

      await tapChip(tester, chips[0]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, true);
      expect(chips[1].selected, false);
      expect(screenState.selector0, selector.elementAt(0));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, false);
      await tapTextField(tester, demoIndex);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '');
      expect(screenState.textList0, ['', smallBodyDesignation]);

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, true);
      expect(screenState.selector0, selector.elementAt(1));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '');
      expect(screenState.textList0, ['', '']);
    });

    testWidgets('Demo 1, keyboardTypes, inputFormattersList', (tester) async {
      const int demoIndex = 1;
      const selector = ChoiceChipInputWidgetScreen.smallBodySelectors;
      await pumpChoiceChipInputWidgetRoute(tester);
      final screenState = tester.state<ChoiceChipInputWidgetScreenState>(
        find.byType(ChoiceChipInputWidgetScreen),
      );
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      List<ChoiceChip> chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(screenState.selector1, null);
      expect(screenState.textList1, ['', '']);

      await tapChip(tester, chips[0]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, true);
      expect(chips[1].selected, false);
      expect(screenState.selector1, selector.elementAt(0));
      final textFieldFinder = getTextFieldFinder(demoIndex);
      TextField textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, false);
      await tapTextField(tester, demoIndex);
      KeyboardVisibilityTesting.setVisibilityForTesting(true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(
        textFieldFinder,
        'abc${smallBodySpkId.toString()}abc',
      );
      expect(screenState.textList1, [smallBodySpkId.toString(), '']);

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, true);
      expect(screenState.selector1, selector.elementAt(1));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, smallBodyDesignation);
      expect(
        screenState.textList1,
        [smallBodySpkId.toString(), smallBodyDesignation],
      );

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, false);
      expect(screenState.selector1, null);
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, false);
      expect(
        screenState.textList1,
        [smallBodySpkId.toString(), smallBodyDesignation],
      );

      await tapTitle(tester, demoIndex);
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.focusNode!.hasFocus, false);

      await tapChip(tester, chips[0]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, true);
      expect(chips[1].selected, false);
      expect(screenState.selector1, selector.elementAt(0));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, false);
      await tapTextField(tester, demoIndex);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '');
      expect(screenState.textList1, ['', smallBodyDesignation]);

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, true);
      expect(screenState.selector1, selector.elementAt(1));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '');
      expect(screenState.textList1, ['', '']);
    });

    testWidgets('Demo 2, keyboardTypes, inputFormattersList', (tester) async {
      const int demoIndex = 2;
      const selector = ChoiceChipInputWidgetScreen.studentSelectors;
      await pumpChoiceChipInputWidgetRoute(tester);
      final screenState = tester.state<ChoiceChipInputWidgetScreenState>(
        find.byType(ChoiceChipInputWidgetScreen),
      );
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      List<ChoiceChip> chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(screenState.selector2, selector.elementAt(2));
      expect(screenState.textList2, ['123', 'Hrishikesh', '.5']);

      await tapChip(tester, chips[0]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, true);
      expect(chips[1].selected, false);
      expect(chips[2].selected, false);
      expect(screenState.selector2, selector.elementAt(0));
      final textFieldFinder = getTextFieldFinder(demoIndex);
      TextField textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, false);
      await tapTextField(tester, demoIndex);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, 'abc456abc');
      expect(screenState.textList2, ['456', 'Hrishikesh', '.5']);

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, true);
      expect(chips[2].selected, false);
      expect(screenState.selector2, selector.elementAt(1));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, 'Kadam');
      expect(screenState.textList2, ['456', 'Kadam', '.5']);

      await tapTitle(tester, demoIndex);
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.focusNode!.hasFocus, false);

      await tapChip(tester, chips[2]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, false);
      expect(chips[2].selected, true);
      expect(screenState.selector2, selector.elementAt(2));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      await tapTextField(tester, demoIndex);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '3.9.8');
      expect(screenState.textList2, ['456', 'Kadam', '3.9']);

      await tapChip(tester, chips[2]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, false);
      expect(chips[2].selected, false);
      expect(screenState.selector2, null);
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, false);
      expect(screenState.textList2, ['456', 'Kadam', '3.9']);

      await tapChip(tester, chips[0]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, true);
      expect(chips[1].selected, false);
      expect(chips[2].selected, false);
      expect(screenState.selector2, selector.elementAt(0));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, false);
      await tapTextField(tester, demoIndex);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '');
      expect(screenState.textList2, ['', 'Kadam', '3.9']);

      await tapChip(tester, chips[1]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, true);
      expect(chips[2].selected, false);
      expect(screenState.selector2, selector.elementAt(1));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '');
      expect(screenState.textList2, ['', '', '3.9']);

      await tapChip(tester, chips[2]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, false);
      expect(chips[2].selected, true);
      expect(screenState.selector2, selector.elementAt(2));
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, '');
      expect(screenState.textList2, ['', '', '']);

      await tapChip(tester, chips[2]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, false);
      expect(chips[1].selected, false);
      expect(chips[2].selected, false);
      expect(screenState.selector2, null);
      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, false);
      expect(screenState.textList2, ['', '', '']);
    });

    testWidgets('Demo 6, disableInputs', (tester) async {
      const int demoIndex = 6;
      await pumpChoiceChipInputWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      expect(chipFinders.hitTestable().evaluate().length, 0);
      expect(getTextFieldFinder(demoIndex).hitTestable().evaluate().length, 0);
    });

    testWidgets('Demo 0, Reset', (tester) async {
      const int demoIndex = 0;
      const selector = ChoiceChipInputWidgetScreen.smallBodySelectors;
      await pumpChoiceChipInputWidgetRoute(tester);
      final screenState = tester.state<ChoiceChipInputWidgetScreenState>(
        find.byType(ChoiceChipInputWidgetScreen),
      );
      await ensureDemoVisible(tester, demoIndex);
      final chipFinders = getChipFindersOf(demoIndex);
      List<ChoiceChip> chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(screenState.selector0, null);
      expect(screenState.textList0, ['', '']);

      await tapChip(tester, chips[0]);
      chips = chipFinders.evaluate().toWidgets<ChoiceChip>();
      expect(chips[0].selected, true);
      expect(chips[1].selected, false);
      expect(screenState.selector0, selector.elementAt(0));
      final textFieldFinder = getTextFieldFinder(demoIndex);
      TextField textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.enabled, true);
      expect(textField.focusNode!.hasFocus, false);
      await tapTextField(tester, demoIndex);
      expect(textField.focusNode!.hasFocus, true);
      await tester.enterText(textFieldFinder, smallBodySpkId.toString());
      expect(screenState.textList0, [smallBodySpkId.toString(), '']);

      await scrollToTop(tester);
      await tester.tap(find.byKey(ChoiceChipInputWidgetScreen.resetKey));
      await tester.pump();
      await ensureDemoVisible(tester, demoIndex);
      expect(screenState.selector0, null);
      expect(screenState.textList0, ['', '']);
    });
  });
}
