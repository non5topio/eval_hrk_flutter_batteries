import 'package:flutter/widgets.dart';

/// To identify invocation from [State] methods
enum StateMethod {
  /// [State.initState]
  initState,

  /// [State.didUpdateWidget]
  didUpdateWidget,
}
