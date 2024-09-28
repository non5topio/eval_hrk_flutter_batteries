// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/choice_chip_input_widget/choice_chip_input_widget_route.dart';
import 'package:playground_app/route/choice_chip_input_widget/choice_chip_input_widget_screen.dart';
import '../../playground_app.dart';

final Finder customScrollViewFinder =
    find.byKey(ChoiceChipInputWidgetScreen.customScrollViewKey);
const String smallBodyDesignation = '2023 HK';
const int smallBodySpkId = 54354503;
const int studentId = 123;
const String studentName = 'Hrishikesh';
const double studentCgpa = 3.5;

Future<void> pumpChoiceChipInputWidgetRoute(WidgetTester tester) async {
  await pumpApp(
    tester,
    initialLocation: ChoiceChipInputWidgetRoute.uri.path,
  );
}

Future<void> ensureDemoVisible(WidgetTester tester, int demoIndex) async {
  await tester.dragUntilVisible(
    find.byKey(ChoiceChipInputWidgetScreen.getDemoScaffoldKey(demoIndex)),
    customScrollViewFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

Finder getHeaderFinder(int demoIndex) {
  return find.byKey(ChoiceChipInputWidgetScreen.getDemoHeaderKey(demoIndex));
}

void expectHeaderContainsDescription(WidgetTester tester, int demoIndex) {
  final headerFinder = getHeaderFinder(demoIndex);
  final headerText = tester.widget<Text>(headerFinder);
  check(headerText.data!).contains(tester.testDescription);
}

// LABEL: eligible-hrk_flutter_test_batteries
Future<void> scrollToTop(WidgetTester tester) async {
  final offset = tester
      .widget<CustomScrollView>(customScrollViewFinder)
      .controller!
      .offset;
  if (offset == 0) {
    return;
  }
  await tester.drag(customScrollViewFinder, Offset(0, offset));
  await tester.pumpAndSettle();
}

Finder getTitleFinder(int demoIndex) {
  return find.byKey(Key(
    '${ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${ChoiceChipInputWidget.titleKey}',
  ));
}

Future<void> tapTitle(WidgetTester tester, int demoIndex) async {
  await tester.tap(getTitleFinder(demoIndex));
  await tester.pump();
}

Finder getTextFieldFinder(int demoIndex) {
  return find.byKey(Key(
    '${ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${ChoiceChipInputWidget.textFieldKey}',
  ));
}

Future<void> tapTextField(WidgetTester tester, int demoIndex) async {
  await tester.tap(getTextFieldFinder(demoIndex));
  await tester.pump();
}

Finder getChipFindersOf(int demoIndex) {
  return find.descendant(
    of: find.byKey(ChoiceChipInputWidgetScreen.getDemoKey(demoIndex)),
    matching: find.byType(ChoiceChip),
  );
}

List<Finder> getChipFinderListOf(int demoIndex, Set<Enum> selectors) {
  return selectors.map((e) {
    return find.byKey(Key(
      '${ChoiceChipInputWidgetScreen.getDemoKeyPrefix(demoIndex)}'
      '${e.name}',
    ));
  }).toList();
}

Future<void> tapChip(WidgetTester tester, ChoiceChip chip) async {
  await tester.tap(find.byKey(chip.key!));
  await tester.pump();
}
