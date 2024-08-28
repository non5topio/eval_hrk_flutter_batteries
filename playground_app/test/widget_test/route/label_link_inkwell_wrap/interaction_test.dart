import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/constants/constants.dart';
import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_screen.dart';
import '../../../src/extension/common_finders.dart';
import '../../../src/globals.dart';
import '../../../src/route/label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';

void main() {
  group('$LabelLinkInkWellWrap Interaction Test', () {
    testWidgets('No interaction', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      const demoWidgetsCount = 4;
      expect(
          find.byType(LabelLinkInkWellWrap), findsNWidgets(demoWidgetsCount));
      final labelFinder = find.descendantText(
        of: listViewKeyFinder,
        text: '${l10n.source}: ',
      );
      expect(labelFinder, findsNWidgets(demoWidgetsCount));
      final uriFinder = find.descendantText(
        of: listViewKeyFinder,
        text: Constants.sourceRepoUrl.toString(),
      );
      expect(uriFinder, findsNWidgets(demoWidgetsCount));
    });

    testWidgets('Basic', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(LabelLinkInkWellWrapScreen.demo1LinkKey));
    });

    testWidgets('With preFollowLink', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(LabelLinkInkWellWrapScreen.demo2LinkKey));
    });

    testWidgets('With customFollowLink', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(LabelLinkInkWellWrapScreen.demo3LinkKey));
    });

    testWidgets('With preFollowLink, customFollowLink', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(LabelLinkInkWellWrapScreen.demo4LinkKey));
    });
  });
}
