import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';

extension HrkFinderResult on FinderResult<Element> {
  // LABEL: eligible-hrk_flutter_test_batteries
  List<T> toWidgets<T>() {
    return map<T>((e) {
      return e.widget as T;
    }).toList();
  }
}
