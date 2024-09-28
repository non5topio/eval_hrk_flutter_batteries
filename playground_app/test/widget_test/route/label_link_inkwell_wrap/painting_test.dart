import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_screen.dart';
import '../../../src/route/label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';

void main() {
  group('$LabelLinkInkWellWrap Painting Test', () {
    testWidgets('Basic', (tester) async {
      int demoIndex = 0;
      await pumpLabelLinkInkWellWrapRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final labelRect = tester.getRect(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLabelKey(demoIndex),
      ));
      final linkRect = tester.getRect(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLinkKey(demoIndex),
      ));
      expect(labelRect.top == linkRect.top, true);
      expect(labelRect.height == linkRect.height, true);
    });

    testWidgets('Wrapped in two lines', (tester) async {
      int demoIndex = 1;
      await pumpLabelLinkInkWellWrapRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final labelRect = tester.getRect(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLabelKey(demoIndex),
      ));
      final linkRect = tester.getRect(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLinkKey(demoIndex),
      ));
      expect(labelRect.top < linkRect.top, true);
      expect(labelRect.height == linkRect.height, true);
    });

    testWidgets('Wrapped in three lines', (tester) async {
      int demoIndex = 2;
      await pumpLabelLinkInkWellWrapRoute(tester);
      await ensureDemoVisible(tester, demoIndex);
      expectHeaderContainsDescription(tester, demoIndex);
      final labelRect = tester.getRect(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLabelKey(demoIndex),
      ));
      final linkRect = tester.getRect(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLinkKey(demoIndex),
      ));
      expect(labelRect.top < linkRect.top, true);
      expect(labelRect.height == linkRect.height / 2, true);
    });
  });
}
