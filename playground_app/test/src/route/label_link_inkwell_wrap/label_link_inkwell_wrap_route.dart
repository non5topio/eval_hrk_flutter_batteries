import 'package:flutter_test/flutter_test.dart';

import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_route.dart';
import 'package:playground_app/route/label_link_inkwell_wrap/label_link_inkwell_wrap_screen.dart';
import '../../playground_app.dart';

final Finder listViewKeyFinder =
    find.byKey(LabelLinkInkWellWrapScreen.listViewKey);

Future<void> pumpLabelLinkInkWellWrapRoute(
  WidgetTester tester,
) async {
  await pumpApp(tester, initialLocation: LabelLinkInkWellWrapRoute.uri.path);
}
