// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_logging/hrk_logging.dart';

import 'package:playground_app/config/config.dart';
import 'hydrated_bloc.dart';

Future<void> configureApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadPubspec();
  configureUrlStrategy();
  configureHrkLogging();
  configureBloc();
  mockHydratedBloc();
}
