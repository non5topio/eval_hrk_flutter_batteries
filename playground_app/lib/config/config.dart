import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hrk_logging/hrk_logging.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

import '../constants/constants.dart';
import '../extension/pubspec.dart';
import 'app_bloc_observer.dart';

import 'config_non_web.dart' if (dart.library.js_interop) 'config_web.dart'
    as platform;

Future<void> configureApp() async {
  configureUrlStrategy();
  configureHrkLogging();
  configureBloc();
  WidgetsFlutterBinding.ensureInitialized();
  await loadPubspec();
  await configureHydratedBloc();
}

void configureUrlStrategy() {
  platform.configureUrlStrategy();
}

void configureBloc() {
  Bloc.observer = const AppBlocObserver();
}

Future<void> configureHydratedBloc() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
}

Pubspec? pubspec;
Future<void> loadPubspec() async {
  if (pubspec == null) {
    pubspec = Pubspec.parse(await rootBundle.loadString('pubspec.yaml'));
    assert(Constants.appName == pubspec!.name);
    assert(Constants.version == pubspec!.getVersionMajorMinorPatch());
  }
}

enum FlavorEnv {
  dev,
  stag,
  prod,
  unflavored;

  factory FlavorEnv.fromString(String flavor) {
    return switch (flavor) {
      'dev' => FlavorEnv.dev,
      'stag' => FlavorEnv.stag,
      'prod' => FlavorEnv.prod,
      '' => FlavorEnv.unflavored,
      _ => throw ArgumentError.value(flavor),
    };
  }
}

final FlavorEnv flavorEnv = FlavorEnv.fromString(
  const String.fromEnvironment('FLAVOR_ENV'),
);

final bool prodRelease = flavorEnv == FlavorEnv.prod && kReleaseMode;

String getPreReleaseVersion() {
  if (prodRelease) {
    return '';
  } else {
    return '${flavorEnv.name}-${getBuildMode()}';
  }
}

// LABEL: eligible-hrk_batteries
String getBuildMode() {
  if (kReleaseMode) {
    return 'release';
  } else if (kProfileMode) {
    return 'profile';
  } else {
    return 'debug';
  }
}

String getCompleteVersion() {
  if (const bool.fromEnvironment('SCREENSHOT_TEST')) {
    return 'x.x.x';
  }
  final String version = pubspec!.getVersionMajorMinorPatch() ?? '';
  final String preReleaseVersion = getPreReleaseVersion();
  final String completeVersion =
      preReleaseVersion.isEmpty ? version : '$version-$preReleaseVersion';
  return completeVersion;
}
