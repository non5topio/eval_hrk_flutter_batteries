import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:playground_app/playground_app.dart';
import 'package:playground_app/route/settings/bloc/settings_bloc.dart';
import 'config/config.dart';
import 'globals.dart' as globals;

Future<void> pumpApp(
  WidgetTester tester, {
  GlobalKey<NavigatorState>? navigatorKey,
  String? initialLocation,
  SettingsBloc? settingsBloc,
  bool debugShowCheckedModeBanner = true,
}) async {
  await configureApp();
  await tester.pumpWidget(
    PlaygroundApp(
      navigatorKey: navigatorKey ?? globals.navigatorKey,
      initialLocation: initialLocation,
      settingsBloc: settingsBloc,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    ),
  );
  await tester.pumpAndSettle();
}
