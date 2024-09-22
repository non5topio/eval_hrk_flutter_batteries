import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/route/label_value_wrap/label_value_wrap_route.dart';
import 'package:playground_app/route/label_value_wrap/label_value_wrap_screen.dart';
import '../../playground_app.dart';

final Finder listViewFinder = find.byKey(LabelValueWrapScreen.listViewKey);

Future<void> ensureDemoVisible(WidgetTester tester, int demoIndex) async {
  await tester.dragUntilVisible(
    find.byKey(LabelValueWrapScreen.getDemoKey(demoIndex)),
    listViewFinder,
    const Offset(0, -200),
  );
  await tester.pumpAndSettle();
}

List<LabelValueWrap> getLabelValueWrapsOf(int demoIndex) {
  final labelValueWrapFinder = find.descendant(
    of: find.byKey(LabelValueWrapScreen.getDemoKey(demoIndex)),
    matching: find.byType(LabelValueWrap),
  );
  return labelValueWrapFinder
      .evaluate()
      .map((e) => e.widget as LabelValueWrap)
      .toList();
}

Future<void> pumpLabelValueWrapRoute(
  WidgetTester tester,
) async {
  await pumpApp(tester, initialLocation: LabelValueWrapRoute.uri.path);
}
