import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/date_range_widget/date_range_widget_screen.dart';
import '../../../src/route/date_range_widget/date_range_widget_route.dart';

void main() {
  group('$DateRangeWidget Painting Test', () {
    testWidgets('Demo 0, Basic', (tester) async {
      const int demoIndex = 0;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
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

    testWidgets('Demo 1, title', (tester) async {
      const int demoIndex = 1;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expect(getTitleFinder(demoIndex), findsOne);
    });

    testWidgets('Demo 3, startEndAlign', (tester) async {
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

    testWidgets('Demo 4, expectNoOverflow', (tester) async {
      const int demoIndex = 4;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      tester.expectNoOverflow(
        of: find.byKey(DateRangeWidgetScreen.getDemoKey(demoIndex)),
      );
    });

    testWidgets('Demo 5, Disabled', (tester) async {
      const int demoIndex = 5;
      await pumpDateRangeWidgetRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      final selectButton =
          tester.widget<FilledButton>(getSelectButtonFinder(demoIndex));
      expect(selectButton.enabled, false);
    });
  });
}
