// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/date_range_widget/date_range_widget_route.dart';
import 'package:playground_app/route/date_range_widget/date_range_widget_screen.dart';
import 'package:playground_app/route/settings/bloc/settings_bloc.dart';
import '../../globals.dart';
import '../../playground_app.dart';

final Finder customScrollViewFinder =
    find.byKey(DateRangeWidgetScreen.customScrollViewKey);
final DateTimeRange dateRangeForTest = HrkDateTimeRange.ofMonth();

Future<void> pumpDateRangeWidgetRoute(
  WidgetTester tester, {
  SettingsBloc? settingsBloc,
}) async {
  await pumpApp(
    tester,
    initialLocation: DateRangeWidgetRoute.uri.path,
    settingsBloc: settingsBloc,
  );
}

Future<void> ensureDemoVisible(WidgetTester tester, int demoIndex) async {
  await tester.dragUntilVisible(
    find.byKey(DateRangeWidgetScreen.getDemoScaffoldKey(demoIndex)),
    customScrollViewFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

Finder getHeaderFinder(int demoIndex) {
  return find.byKey(DateRangeWidgetScreen.getDemoHeaderKey(demoIndex));
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

Future<void> tapFillAllDatesAction(WidgetTester tester) async {
  await scrollToTop(tester);
  await tester.tap(find.byKey(DateRangeWidgetScreen.fillAllDatesKey));
  await tester.pump();
}

Finder getTitleFinder(int demoIndex) {
  return find.byKey(Key(
    '${DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${DateRangeWidget.titleKey}',
  ));
}

Finder getStartLabelFinder(int demoIndex) {
  return find.byKey(Key(
    '${DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${DateRangeWidget.startLabelKey}',
  ));
}

Finder getEndLabelFinder(int demoIndex) {
  return find.byKey(Key(
    '${DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${DateRangeWidget.endLabelKey}',
  ));
}

Finder getStartDateFinder(int demoIndex) {
  return find.byKey(Key(
    '${DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${DateRangeWidget.startDateKey}',
  ));
}

Finder getEndDateFinder(int demoIndex) {
  return find.byKey(Key(
    '${DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${DateRangeWidget.endDateKey}',
  ));
}

Finder getSelectButtonFinder(int demoIndex) {
  return find.byKey(Key(
    '${DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex)}'
    '${DateRangeWidget.selectButtonKey}',
  ));
}

Future<void> tapSelectButton(WidgetTester tester, int demoIndex) async {
  await tester.tap(getSelectButtonFinder(demoIndex));
  await tester.pump();
}

Future<void> selectDateRange(
  WidgetTester tester,
  int demoIndex, {
  DateTimeRange? dateRange,
}) async {
  dateRange ??= dateRangeForTest;
  await tapSelectButton(tester, demoIndex);
  await tester.tap(find.text(dateRange.start.day.toString()).first);
  await tester.tap(find.text(dateRange.end.day.toString()).first);
  await tester.pump();
  await tester.tap(find.widgetWithText(TextButton, ml10n.saveButtonLabel));
  await tester.pump();
}
