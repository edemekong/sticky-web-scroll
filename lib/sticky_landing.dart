import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StickyLanding extends SliverPersistentHeaderDelegate {
  final double collapseHeight;
  final double bottomHeight;
  final FloatingHeaderSnapConfiguration snap;
  final Widget collapse;
  final Widget bottom;

  StickyLanding({
    @required this.bottomHeight,
    @required this.collapse,
    @required this.bottom,
    @required this.collapseHeight,
    this.snap,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final firstBarOffset = (-shrinkOffset * 0.01) - shrinkOffset;
    final secondBarOffset = (-shrinkOffset * 1) + shrinkOffset;

    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: secondBarOffset,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [
                  Container(
                    height: bottomHeight + 3,
                    child: bottom ?? SizedBox(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: firstBarOffset - bottomHeight,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [
                  Container(
                    height: collapseHeight,
                    child: collapse ?? SizedBox(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => collapseHeight;

  @override
  double get minExtent => bottomHeight;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => snap;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
