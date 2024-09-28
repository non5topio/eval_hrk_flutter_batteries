import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_nasa_apis/hrk_nasa_apis.dart';

import 'package:playground_app/route/choice_chip_group/choice_chip_group_screen.dart';
import '../../../src/eligible.dart';

void main() {
  group('$ChoiceChipGroup Assert Test', () {
    testWidgets('labels.length == values.length', (tester) async {
      getWidget() {
        return ChoiceChipGroup<CloseApproachBody>(
          values: ChoiceChipGroupScreen.closeApproachBodySet,
          labels: {CloseApproachBody.earth.name},
          onChipSelected: (value) {},
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });

    testWidgets('keys == null || keys.length == values.length', (tester) async {
      getWidget() {
        return ChoiceChipGroup<CloseApproachBody>(
          values: ChoiceChipGroupScreen.closeApproachBodySet,
          labels: ChoiceChipGroupScreen.closeApproachBodySet
              .map((e) => e.name)
              .toSet(),
          keys: {CloseApproachBody.earth.name},
          onChipSelected: (value) {},
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });
  });
}
