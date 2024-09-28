import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

// LABEL: eligible-hrk_flutter_test_batteries
Widget getMaterialScaffold({required Widget body}) {
  return MaterialApp(
    home: Scaffold(
      body: body,
    ),
  );
}

// LABEL: eligible-hrk_flutter_test_batteries
/// A matcher for functions that throw [AssertionError], containing the
/// [tester.testDescription] in the [AssertionError.toString]
// _AssertionError: https://github.com/dart-lang/sdk/blob/dfe15b19ac906f376580c18300a9b7c97ed9759f/sdk/lib/_internal/vm/lib/errors_patch.dart#L30
// Edge cases for toString():
// - inputFormattersList == null || inputFormattersList.length == values.length
Matcher throwsAssertionErrorContainingDescription(WidgetTester tester) {
  return throwsA(
    predicate((e) {
      String string = e.toString();
      string = string.replaceAll(RegExp(r'^\s+', multiLine: true), '');
      string = string.replaceAll(RegExp('\n', multiLine: true), ' ');
      return e is AssertionError && string.contains(tester.testDescription);
    }, 'AssertionError containing ${tester.testDescription}'),
  );
}
