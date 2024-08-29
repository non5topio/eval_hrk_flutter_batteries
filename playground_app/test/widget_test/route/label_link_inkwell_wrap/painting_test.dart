import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_screen.dart';
import '../../../src/route/label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';

void main() {
  group('$LabelLinkInkWellWrap Painting Test', () {
    testWidgets('Not wrapped', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      final labelRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo1LabelKey),
      );
      final linkRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo1LinkKey),
      );
      expect(labelRect.top == linkRect.top, true);
      expect(labelRect.height == linkRect.height, true);
    });

    testWidgets('Wrapped in two lines', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      final labelRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo2LabelKey),
      );
      final linkRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo2LinkKey),
      );
      expect(labelRect.top < linkRect.top, true);
      expect(labelRect.height == linkRect.height, true);
    });

    testWidgets('Wrapped in three lines', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      final labelRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo3LabelKey),
      );
      final linkRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo3LinkKey),
      );
      expect(labelRect.top < linkRect.top, true);
      expect(labelRect.height == linkRect.height / 2, true);
    });
  });
}
