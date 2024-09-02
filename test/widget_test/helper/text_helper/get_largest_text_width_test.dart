import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

void main() {
  group('getLargestTextWidth()', () {
    final globalKey = GlobalKey(debugLabel: 'getLargestTextWidth');
    const Set<String> labels = {
      'Zeroth',
      'First',
      'Second',
      'Third',
      'Fourth',
      'Fifth',
      'Sixth',
      'Seventh',
      'Eight',
      'Ninth',
    };

    Widget getTestWidget() {
      return MaterialApp(
        key: globalKey,
      );
    }

    testWidgets('Basic', (tester) async {
      await tester.pumpWidget(getTestWidget());
      expect(
        getLargestTextWidth(
          context: globalKey.currentContext!,
          textSet: labels,
        ),
        98,
      );
    });
  });
}
