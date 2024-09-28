import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_nasa_apis/hrk_nasa_apis.dart';

import 'package:playground_app/route/filter_chip_group/filter_chip_group_screen.dart';
import '../../../src/eligible.dart';

void main() {
  group('$FilterChipGroup Assert Test', () {
    testWidgets('labels.length == values.length', (tester) async {
      getWidget() {
        return FilterChipGroup<CloseApproachBody>(
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: {CloseApproachBody.earth.name},
          onChipsSelected: (Set<CloseApproachBody> selectedSet) {},
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });

    testWidgets('keys == null || keys.length == values.length', (tester) async {
      getWidget() {
        return FilterChipGroup<CloseApproachBody>(
          values: FilterChipGroupScreen.closeApproachBodySet,
          labels: FilterChipGroupScreen.closeApproachBodySet
              .map((e) => e.name)
              .toSet(),
          keys: {CloseApproachBody.earth.name},
          onChipsSelected: (Set<CloseApproachBody> selectedSet) {},
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });
  });
}
