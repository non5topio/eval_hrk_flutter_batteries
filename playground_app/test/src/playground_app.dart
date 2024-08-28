import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:playground_app/playground_app.dart';
import 'config/config.dart';
import 'globals.dart' as globals;

Future<void> pumpApp(
  WidgetTester tester, {
  GlobalKey<NavigatorState>? navigatorKey,
  String? initialLocation,
  bool debugShowCheckedModeBanner = true,
}) async {
  await configureApp();
  await tester.pumpWidget(
    PlaygroundApp(
      navigatorKey: navigatorKey ?? globals.navigatorKey,
      initialLocation: initialLocation,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    ),
  );
  await tester.pumpAndSettle();
}
