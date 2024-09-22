import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

void main() {
  group('HrkDateTimeRange', () {
    test('ofMonth()', () {
      final now = DateTime.now();
      final dateTimeRange = HrkDateTimeRange.ofMonth(now);
      expect(dateTimeRange.start.year, now.year);
      expect(dateTimeRange.start.month, now.month);
      expect(dateTimeRange.start.day, 1);
      expect(dateTimeRange.start.hour, 0);
      expect(dateTimeRange.start.minute, 0);
      expect(dateTimeRange.start.second, 0);
      expect(dateTimeRange.start.millisecond, 0);
      expect(dateTimeRange.start.microsecond, 0);
      expect(dateTimeRange.end.year, now.year);
      expect(dateTimeRange.end.month, now.month);
      expect(dateTimeRange.end.day, now.daysInMonth());
      expect(dateTimeRange.end.hour, 23);
      expect(dateTimeRange.end.minute, 59);
      expect(dateTimeRange.end.second, 59);
      expect(dateTimeRange.end.millisecond, 999);
      expect(dateTimeRange.end.microsecond, 999);
    });
  });
}
