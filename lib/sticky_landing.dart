import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StickyLanding extends SliverPersistentHeaderDelegate {
  final double landingHeight;
  final double offset;
  final FloatingHeaderSnapConfiguration snap;
  final Widget collapse;
  final Widget visibleChild;

  StickyLanding({
    @required this.collapse,
    @required this.visibleChild,
    @required this.landingHeight,
    this.offset,
    this.snap,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final firstBarOffset = (-shrinkOffset * 0.01) - shrinkOffset;
    final secondBarOffset = (-shrinkOffset * 0.01) - shrinkOffset;
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: secondBarOffset < -1.00 ? 1 : secondBarOffset,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [visibleChild ?? Container()],
              ),
            ),
          ),
          Positioned(
            top: firstBarOffset,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [collapse ?? Container()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => landingHeight;

  @override
  double get minExtent => 60;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => snap;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
