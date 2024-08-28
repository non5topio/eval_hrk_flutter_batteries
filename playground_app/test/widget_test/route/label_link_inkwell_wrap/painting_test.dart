import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_screen.dart';
import '../../../src/constants/dimensions.dart';
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
    });

    testWidgets('Wraps on ${TestDimensions.galaxyFoldPortraitWidth}',
        (tester) async {
      tester.view.setLogicalSize(
        width: TestDimensions.galaxyFoldPortraitWidth,
        height: TestDimensions.galaxyFoldPortraitHeight,
      );
      await pumpLabelLinkInkWellWrapRoute(tester);
      final labelRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo1LabelKey),
      );
      final linkRect = tester.getRect(
        find.byKey(LabelLinkInkWellWrapScreen.demo1LinkKey),
      );
      expect(labelRect.top < linkRect.top, true);
    });
  });
}
