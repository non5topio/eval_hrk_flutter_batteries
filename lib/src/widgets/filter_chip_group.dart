import 'package:flutter/material.dart';

import '../../hrk_flutter_batteries.dart';

typedef ChipsSelected<T> = void Function(Set<T> selectedSet);

/// [FilterChip] Group for multiple select. Use [ChoiceChipGroup] for single
/// select.
class FilterChipGroup<T> extends StatelessWidget {
  const FilterChipGroup({
    super.key,
    this.keyPrefix = '',
    this.enabled = true,
    this.title,
    required this.values,
    required this.labels,
    this.keys,
    this.selectedSet = const {},
    this.disableInputs = false,
    this.spacing = HrkDimensions.bodyItemSpacing,
    this.onChipsSelected,
  })  : assert(labels.length == values.length),
        assert(keys == null || keys.length == values.length);

  final String keyPrefix;
  final bool enabled;
  final String? title;
  final Set<T> values;
  final Set<String> labels;
  final Set<String>? keys;
  final Set<T> selectedSet;
  final bool disableInputs;
  final double spacing;
  final ChipsSelected<T>? onChipsSelected;
  static const String defaultKeyPrefix = 'filter_chip_group_';

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disableInputs,
      child: Column(
        children: [
          if (title != null)
            Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          if (title != null) SizedBox(height: spacing),
          _getFilterChips(context)
        ],
      ),
    );
  }

  Wrap _getFilterChips(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: WrapAlignment.center,
      children: List<Widget>.generate(
        values.length,
        (index) {
          return FilterChip(
            key: keys != null
                ? Key('$keyPrefix${keys!.elementAt(index)}')
                : null,
            label: Text(
              labels.elementAt(index),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            selected: selectedSet.contains(values.elementAt(index)),
            onSelected: enabled
                ? (selectedBool) {
                    _onSelected(selectedBool, index);
                  }
                : null,
          );
        },
      ),
    );
  }

  void _onSelected(bool selectedBool, int index) {
    if (onChipsSelected != null) {
      final Set<T> newSelectedSet = Set.from(selectedSet);
      if (selectedBool) {
        newSelectedSet.add(values.elementAt(index));
      } else {
        newSelectedSet.remove(values.elementAt(index));
      }
      onChipsSelected!(newSelectedSet);
    }
  }
}
