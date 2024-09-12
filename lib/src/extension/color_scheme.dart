import 'package:flutter/material.dart';

import 'package:material_color_utilities/material_color_utilities.dart';

extension HrkColorScheme on ColorScheme {
  /// For surface which contains brightness unaware contents like brand images.
  ///
  /// This would hardly differ between light and dark themes with same
  /// seedColor. </br>
  /// It might differ less than 6.5%. </br>
  /// See: test/unit_test/extension/color_scheme_test.dart
  Color get surfaceFixed {
    // TODO(hrishikesh-kadam): Fix these everywhere once the deprecations are in stable
    // ignore: deprecated_member_use
    final Hct surfaceHct = Hct.fromInt(surface.value);
    final Hct surfaceFixedHct = Hct.from(
      surfaceHct.hue,
      surfaceHct.chroma,
      80,
    );
    return Color(surfaceFixedHct.toInt());
  }
}
