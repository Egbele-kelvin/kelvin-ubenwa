import 'package:flutter/widgets.dart';

class DisableLeftScrollPhysics extends ScrollPhysics {
  const DisableLeftScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  DisableLeftScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return DisableLeftScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // Prevent left scrolling by allowing negative values only if scrolling right
    if (value < 0.0 && position.extentAfter == 0.0) {
      return 0.0;
    }
    return super.applyBoundaryConditions(position, value);
  }
}

class DisableLeftScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const DisableLeftScrollPhysics();
  }
}