import 'package:flutter/material.dart';

import 'config/config.dart';
import 'playground_app.dart';

Future<void> main({
  GlobalKey<NavigatorState>? navigatorKey,
  String? initialLocation,
  bool debugShowCheckedModeBanner = true,
}) async {
  await configureApp();
  runApp(
    PlaygroundApp(
      navigatorKey: navigatorKey,
      initialLocation: initialLocation,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    ),
  );
}
