import 'dart:math';

import 'package:flutter/widgets.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  HeaderDelegate({
    this.minHeight = 50,
    this.maxHeight = 80.0,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      SizedBox.expand(child: child);

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != (oldDelegate as HeaderDelegate).maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
