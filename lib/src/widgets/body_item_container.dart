import 'package:flutter/material.dart';

import '../constants/hrk_dimensions.dart';

class BodyItemContainer extends StatelessWidget {
  const BodyItemContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HrkDimensions.bodyItemWidth,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(
          HrkDimensions.containerRadius,
        )),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      padding: const EdgeInsets.all(HrkDimensions.bodyItemPadding),
      margin: const EdgeInsets.all(HrkDimensions.bodyItemMargin),
      child: child,
    );
  }
}
