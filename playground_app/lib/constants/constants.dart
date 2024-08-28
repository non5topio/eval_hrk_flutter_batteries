import 'package:recase/recase.dart';

class Constants {
  static const String appName = 'playground_app';
  static const String packageName = 'hrk_flutter_batteries';
  static const String version = '1.0.0';
  static const String authorUsername = 'hrishikesh-kadam';
  static final Uri linktreeUrl = Uri.https(
    'linktr.ee',
    authorUsername.snakeCase,
  );
  static final Uri sourceRepoUrl = Uri.https(
    'github.com',
    '$authorUsername/$packageName',
  );
}
