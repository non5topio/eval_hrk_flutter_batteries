import 'package:flutter/widgets.dart';

import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:json_annotation/json_annotation.dart';

class LocaleJsonConverter implements JsonConverter<Locale?, JsonMap?> {
  const LocaleJsonConverter();

  @override
  Locale? fromJson(JsonMap? json) {
    if (json == null) {
      return null;
    } else {
      return Locale.fromSubtags(
        languageCode: json['languageCode'],
        scriptCode: json['scriptCode'],
        countryCode: json['countryCode'],
      );
    }
  }

  @override
  JsonMap? toJson(Locale? object) {
    if (object == null) {
      return null;
    } else {
      JsonMap json = {};
      json['languageCode'] = object.languageCode;
      if (object.scriptCode != null) {
        json['scriptCode'] = object.scriptCode;
      }
      if (object.countryCode != null) {
        json['countryCode'] = object.countryCode;
      }
      return json;
    }
  }
}
