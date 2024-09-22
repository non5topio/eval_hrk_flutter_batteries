import 'package:flutter/material.dart';

import 'package:hrk_batteries/hrk_batteries.dart';

extension HrkDateTimeRange on DateTimeRange {
  /// DateTimeRange of [dateTime]'s Month with the use of extension methods
  /// [HrkDateTime.startOfMonth] and [HrkDateTime.endOfMonth]
  ///
  /// [dateTime] defaults to [DateTime.now]
  static DateTimeRange ofMonth([
    DateTime? dateTime,
  ]) {
    dateTime ??= DateTime.now();
    return DateTimeRange(
      start: dateTime.startOfMonth(),
      end: dateTime.endOfMonth(),
    );
  }
}
