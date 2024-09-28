import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/label_value_wrap/label_value_wrap_screen.dart';
import '../../../src/route/label_value_wrap/label_value_wrap_route.dart';

void main() {
  group('$LabelValueWrap Painting Test', () {
    int expectedLabelValueWrapPerDemo = 15;

    testWidgets('Not wrapped', (tester) async {
      const int demoIndex = 0;
      await pumpLabelValueWrapRoute(tester);
      disableOverflowError();
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final labelValueWraps = getLabelValueWrapsOf(demoIndex);
      expect(labelValueWraps.length, expectedLabelValueWrapPerDemo);
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

    testWidgets('Wrapped', (tester) async {
      const int demoIndex = 1;
      disableOverflowError();
      await pumpLabelValueWrapRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final labelValueWraps = getLabelValueWrapsOf(demoIndex);
      expect(labelValueWraps.length, expectedLabelValueWrapPerDemo);
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

    testWidgets('expectNoOverflow()', (tester) async {
      const int demoIndex = 2;
      disableOverflowError();
      await pumpLabelValueWrapRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
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
