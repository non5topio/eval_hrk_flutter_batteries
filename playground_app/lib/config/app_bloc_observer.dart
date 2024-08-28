import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrk_logging/hrk_logging.dart';

import '../globals.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @visibleForTesting
  static final Logger logger = Logger('$appNamePascalCase.AppBlocObserver')
    ..level = Level.ALL;

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.error('${bloc.runtimeType}', {
      error: error,
      stackTrace: stackTrace,
    });
    super.onError(bloc, error, stackTrace);
  }
}
