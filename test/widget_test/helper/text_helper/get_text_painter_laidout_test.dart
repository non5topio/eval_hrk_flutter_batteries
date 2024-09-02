// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

void main() {
  group('getTextPainterLaidout()', () {
    final globalKey = GlobalKey(debugLabel: 'getTextPainterLaidout');
    const labelString = 'Label:';
    const longValueString = '123456789';
    const shortValueString = '123';

    Widget getTestWidget() {
      return MaterialApp(
        key: globalKey,
      );
    }

    testWidgets('$labelString $longValueString', (tester) async {
      await tester.pumpWidget(getTestWidget());
      final TextPainter labelTextPainter = getTextPainterLaidout(
        context: globalKey.currentContext!,
        text: labelString,
      );
      final TextPainter valueTextPainter = getTextPainterLaidout(
        context: globalKey.currentContext!,
        text: longValueString,
      );
      check(labelTextPainter.width).isLessThan(valueTextPainter.width);
    });

    testWidgets('$labelString $shortValueString', (tester) async {
      await tester.pumpWidget(getTestWidget());
      final TextPainter labelTextPainter = getTextPainterLaidout(
        context: globalKey.currentContext!,
        text: labelString,
      );
      final TextPainter valueTextPainter = getTextPainterLaidout(
        context: globalKey.currentContext!,
        text: shortValueString,
      );
      check(labelTextPainter.width).isGreaterThan(valueTextPainter.width);
    });
  });
}
