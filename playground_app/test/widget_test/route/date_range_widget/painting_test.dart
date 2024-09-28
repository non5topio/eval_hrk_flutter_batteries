// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/date_range_widget/date_range_widget_screen.dart';
import '../../../src/route/date_range_widget/date_range_widget_route.dart';

void main() {
  group('$DateRangeWidget Painting Test', () {
    testWidgets('Basic', (tester) async {
      const int demoIndex = 0;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsNothing);
      final startLabelText =
          tester.widget<Text>(getStartLabelFinder(demoIndex));
      final endLabelText = tester.widget<Text>(getEndLabelFinder(demoIndex));
      final startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      final endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      expect(startDateText.data, DateRangeWidget.dateTextDefault);
      expect(endDateText.data, DateRangeWidget.dateTextDefault);
      expect(startLabelText.textAlign, isNull);
      expect(endLabelText.textAlign, isNull);
      expect(startDateText.textAlign, isNull);
      expect(endDateText.textAlign, isNull);
    });

    testWidgets('title, dateTextDefault', (tester) async {
      const int demoIndex = 1;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsOne);
      Text startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      Text endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      check(startDateText.data)
          .equals(DateRangeWidgetScreen.customDateTextDefault);
      check(endDateText.data)
          .equals(DateRangeWidgetScreen.customDateTextDefault);
    });

    testWidgets('startEndAlign', (tester) async {
      const int demoIndex = 3;
      await pumpDateRangeWidgetRoute(tester);
      await tapFillAllDatesAction(tester);
      await ensureDemoVisible(tester, demoIndex);
      final startLabelRect = tester.getRect(getStartLabelFinder(demoIndex));
      final endLabelRect = tester.getRect(getEndLabelFinder(demoIndex));
      final startDateRect = tester.getRect(getStartDateFinder(demoIndex));
      final endDateRect = tester.getRect(getEndDateFinder(demoIndex));
      expect(
        <Size>{
          startLabelRect.size,
          endLabelRect.size,
          startDateRect.size,
          endDateRect.size
        }.length,
        1,
      );
      final startLabelText =
          tester.widget<Text>(getStartLabelFinder(demoIndex));
      final endLabelText = tester.widget<Text>(getEndLabelFinder(demoIndex));
      final startDateText = tester.widget<Text>(getStartDateFinder(demoIndex));
      final endDateText = tester.widget<Text>(getEndDateFinder(demoIndex));
      expect(startLabelText.textAlign, TextAlign.end);
      expect(endLabelText.textAlign, TextAlign.end);
      expect(startDateText.textAlign, TextAlign.start);
      expect(endDateText.textAlign, TextAlign.start);
    });

    testWidgets('expectNoOverflow()', (tester) async {
      const int demoIndex = 4;
      disableOverflowError();
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      tester.expectNoOverflow(
        of: find.byKey(DateRangeWidgetScreen.getDemoKey(demoIndex)),
      );
    });

    testWidgets('Disabled', (tester) async {
      const int demoIndex = 5;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final selectButton =
          tester.widget<FilledButton>(getSelectButtonFinder(demoIndex));
      expect(selectButton.enabled, false);
    });
  });
}
