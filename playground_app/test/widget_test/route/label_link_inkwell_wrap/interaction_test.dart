import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import 'package:playground_app/constants/constants.dart';
import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_screen.dart';
import '../../../src/globals.dart';
import '../../../src/route/label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';

void main() {
  group('$LabelLinkInkWellWrap Interaction Test', () {
    testWidgets('No interaction', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      const demoWidgetsCount = 6;
      expect(
          find.byType(LabelLinkInkWellWrap), findsNWidgets(demoWidgetsCount));
      final labelFinder = find.descendantText(
        of: listViewFinder,
        text: '${l10n.source}: ',
      );
      expect(labelFinder, findsNWidgets(demoWidgetsCount));
      final uriFinder = find.descendantText(
        of: listViewFinder,
        text: Constants.sourceRepoUrl.toString(),
      );
      expect(uriFinder, findsNWidgets(demoWidgetsCount));
    });

    testWidgets('Basic', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLinkKey(0),
      ));
    });

    testWidgets('preFollowLink', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLinkKey(3),
      ));
    });

    testWidgets('customFollowLink', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLinkKey(4),
      ));
    });

    testWidgets('preFollowLink, customFollowLink', (tester) async {
      await pumpLabelLinkInkWellWrapRoute(tester);
      await tester.tap(find.byKey(
        LabelLinkInkWellWrapScreen.getDemoLinkKey(5),
      ));
    });
  });
}
