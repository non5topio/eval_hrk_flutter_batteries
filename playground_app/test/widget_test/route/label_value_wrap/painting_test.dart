import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/label_value_wrap/label_value_wrap_screen.dart';
import '../../../src/route/label_value_wrap/label_value_wrap_route.dart';

void main() {
  group('$LabelValueWrap Painting Test', () {
    int expectedLabelValueWrapPerDemo = 15;

    testWidgets('Not wrapped', (tester) async {
      await pumpLabelValueWrapRoute(tester);
      int demoIndex = 0;
      await ensureDemoVisible(tester, demoIndex);
      final labelValueWraps = getLabelValueWrapsOf(demoIndex);
      expect(labelValueWraps.length, expectedLabelValueWrapPerDemo);
      tester.expectNoOverflow(
        of: find.byKey(LabelValueWrapScreen.getDemoKey(demoIndex)),
      );
      int notWrappedCount = 0;
      for (final labelValueWrap in labelValueWraps) {
        final labelRect = tester.getRect(find.byKey(labelValueWrap.labelKey));
        final valueRect = tester.getRect(find.byKey(labelValueWrap.valueKey));
        if (labelRect.top == valueRect.top &&
            labelRect.height == valueRect.height) {
          notWrappedCount++;
        }
      }
      expect(notWrappedCount, greaterThan(0));
    });

    testWidgets('Wrapped on ${LabelValueWrapScreen.demo1Width}',
        (tester) async {
      await pumpLabelValueWrapRoute(tester);
      int demoIndex = 1;
      await ensureDemoVisible(tester, demoIndex);
      final labelValueWraps = getLabelValueWrapsOf(demoIndex);
      expect(labelValueWraps.length, expectedLabelValueWrapPerDemo);
      tester.expectNoOverflow(
        of: find.byKey(LabelValueWrapScreen.getDemoKey(demoIndex)),
      );
      int wrappedCount = 0;
      for (final labelValueWrap in labelValueWraps) {
        final labelRect = tester.getRect(find.byKey(labelValueWrap.labelKey));
        final valueRect = tester.getRect(find.byKey(labelValueWrap.valueKey));
        if (labelRect.top < valueRect.top &&
            labelRect.height <= valueRect.height) {
          wrappedCount++;
        }
      }
      expect(wrappedCount, greaterThan(0));
    });

    testWidgets('Wrapped on ${DeviceDimensions.galaxyFoldPortraitWidth}',
        (tester) async {
      await pumpLabelValueWrapRoute(tester);
      int demoIndex = 2;
      await ensureDemoVisible(tester, demoIndex);
      final labelValueWraps = getLabelValueWrapsOf(demoIndex);
      expect(labelValueWraps.length, expectedLabelValueWrapPerDemo);
      tester.expectNoOverflow(
        of: find.byKey(LabelValueWrapScreen.getDemoKey(demoIndex)),
      );
      int wrappedCount = 0;
      for (final labelValueWrap in labelValueWraps) {
        final labelRect = tester.getRect(find.byKey(labelValueWrap.labelKey));
        final valueRect = tester.getRect(find.byKey(labelValueWrap.valueKey));
        if (labelRect.top < valueRect.top &&
            labelRect.height <= valueRect.height) {
          wrappedCount++;
        }
      }
      expect(wrappedCount, greaterThan(0));
    });
  });
}
