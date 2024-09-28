import 'package:flutter/services.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import 'package:playground_app/model/human_selector.dart';
import '../../../src/eligible.dart';

void main() {
  group('$ChoiceChipInputWidget Assert Test', () {
    testWidgets('labels.length == values.length', (tester) async {
      getWidget() {
        return ChoiceChipInputWidget<StudentSelector>(
          values: StudentSelector.values.toSet(),
          labels: {StudentSelector.id.name, StudentSelector.name.name},
          selected: StudentSelector.values.first,
          textList: List.filled(StudentSelector.values.length, ''),
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });

    testWidgets('keys == null || keys.length == values.length', (tester) async {
      getWidget() {
        return ChoiceChipInputWidget<StudentSelector>(
          values: StudentSelector.values.toSet(),
          labels: StudentSelector.values.map((e) => e.displayName).toSet(),
          keys: {StudentSelector.id.name, StudentSelector.name.name},
          selected: StudentSelector.values.first,
          textList: List.filled(StudentSelector.values.length, ''),
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });

    testWidgets('textList.length == values.length', (tester) async {
      getWidget() {
        return ChoiceChipInputWidget<StudentSelector>(
          values: StudentSelector.values.toSet(),
          labels: StudentSelector.values.map((e) => e.displayName).toSet(),
          selected: StudentSelector.values.first,
          textList: List.filled(StudentSelector.values.length + 1, ''),
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });

    testWidgets(
        'keyboardTypes == null || keyboardTypes.length == values.length',
        (tester) async {
      getWidget() {
        return ChoiceChipInputWidget<StudentSelector>(
          values: StudentSelector.values.toSet(),
          labels: StudentSelector.values.map((e) => e.displayName).toSet(),
          selected: StudentSelector.values.first,
          textList: List.filled(StudentSelector.values.length, ''),
          keyboardTypes: const [TextInputType.number, TextInputType.name],
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });

    testWidgets(
        'inputFormattersList == null || '
        'inputFormattersList.length == values.length', (tester) async {
      getWidget() {
        return ChoiceChipInputWidget<StudentSelector>(
          values: StudentSelector.values.toSet(),
          labels: StudentSelector.values.map((e) => e.displayName).toSet(),
          selected: StudentSelector.values.first,
          textList: List.filled(StudentSelector.values.length, ''),
          inputFormattersList: [
            [FilteringTextInputFormatter.digitsOnly],
            null,
          ],
        );
      }

      expect(() {
        tester.pumpWidget(getMaterialScaffold(body: getWidget()));
      }, throwsAssertionErrorContainingDescription(tester));
    });
  });
}
