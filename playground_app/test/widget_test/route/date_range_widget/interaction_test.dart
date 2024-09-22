// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_test_batteries/hrk_test_batteries.dart';

import 'package:playground_app/route/date_range_widget/date_range_widget_screen.dart';
import 'package:playground_app/route/settings/bloc/settings_bloc.dart';
import '../../../src/config/hydrated_bloc.dart';
import '../../../src/route/date_range_widget/date_range_widget_route.dart';

void main() {
  group('$DateRangeWidget Interaction Test', () {
    testWidgets('Demo 0, Basic', (tester) async {
      mockHydratedBloc();
      final SettingsBloc settingsBloc = SettingsBloc();
      const int demoIndex = 0;
      await pumpDateRangeWidgetRoute(tester, settingsBloc: settingsBloc);
      await ensureDemoVisible(tester, demoIndex);
      await selectDateRange(tester, demoIndex);
      final startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      final endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      final dateFormat = settingsBloc.state.getDateFormat();
      expect(startDateText.data, dateFormat.format(dateRangeForTest.start));
      expect(endDateText.data, dateFormat.format(dateRangeForTest.end));
    });

    testWidgets('Demo 6, disableInputs', (tester) async {
      const int demoIndex = 6;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      final selectButtonFinder = getSelectButtonFinder(demoIndex);
      expect(selectButtonFinder.hitTestable().evaluate().length, 0);
    });

    testWidgets('Demo 0, resets to ${DateRangeWidget.dateTextDefault}',
        (tester) async {
      const int demoIndex = 0;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      Text startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      Text endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      check(startDateText.data).equals(DateRangeWidget.dateTextDefault);
      check(endDateText.data).equals(DateRangeWidget.dateTextDefault);
      await tapFillAllDatesAction(tester);
      await ensureDemoVisible(tester, demoIndex);
      startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      check(startDateText.data).notEquals(DateRangeWidget.dateTextDefault);
      check(endDateText.data).notEquals(DateRangeWidget.dateTextDefault);
      await tapSelectButton(tester, demoIndex);
      await tester.tap(find.byType(CloseButton));
      await tester.pump();
      startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      check(startDateText.data).equals(DateRangeWidget.dateTextDefault);
      check(endDateText.data).equals(DateRangeWidget.dateTextDefault);
    });

    testWidgets(
        'Demo 1, resets to ${DateRangeWidgetScreen.customDateTextDefault}',
        (tester) async {
      const int demoIndex = 1;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      Text startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      Text endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      check(startDateText.data)
          .equals(DateRangeWidgetScreen.customDateTextDefault);
      check(endDateText.data)
          .equals(DateRangeWidgetScreen.customDateTextDefault);
      await tapFillAllDatesAction(tester);
      await ensureDemoVisible(tester, demoIndex);
      startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      check(startDateText.data).notEquals(DateRangeWidget.dateTextDefault);
      check(endDateText.data).notEquals(DateRangeWidget.dateTextDefault);
      check(startDateText.data)
          .notEquals(DateRangeWidgetScreen.customDateTextDefault);
      check(endDateText.data)
          .notEquals(DateRangeWidgetScreen.customDateTextDefault);
      await tapSelectButton(tester, demoIndex);
      await tester.tap(find.byType(CloseButton));
      await tester.pump();
      startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      check(startDateText.data)
          .equals(DateRangeWidgetScreen.customDateTextDefault);
      check(endDateText.data)
          .equals(DateRangeWidgetScreen.customDateTextDefault);
    });
  });
}
