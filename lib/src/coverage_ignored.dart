// coverage:ignore-file

import 'package:flutter/foundation.dart';

// https://github.com/MisterJimson/flutter_keyboard_visibility
bool isKeyboardVisibilitySupported() {
  if (kIsWeb) {
    return false;
  } else {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android || TargetPlatform.iOS => true,
      _ => false
    };
  }
}
