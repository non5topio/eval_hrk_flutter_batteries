import 'package:flutter/widgets.dart';

import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:json_annotation/json_annotation.dart';

import 'locale_json_converter.dart';
import 'locale_list_json_converter_2.dart';

/// Locale list json converter for Nullable
///
/// See [LocaleListJsonConverter2] for non-nullable
class LocaleListJsonConverter
    implements JsonConverter<List<Locale>?, List<dynamic>?> {
  const LocaleListJsonConverter();

  @override
  List<Locale>? fromJson(List<dynamic>? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return null;
    } else {
      return jsonList.map((e) {
        return const LocaleJsonConverter().fromJson(e)!;
      }).toList();
    }
  }

  @override
  List<JsonMap>? toJson(List<Locale>? localeList) {
    if (localeList == null || localeList.isEmpty) {
      return null;
    } else {
      return localeList.map((e) {
        return const LocaleJsonConverter().toJson(e)!;
      }).toList();
    }
  }
}
