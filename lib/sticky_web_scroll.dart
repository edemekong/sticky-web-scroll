library sticky_web_scroll;

import 'package:flutter/material.dart';
import 'package:sticky_web_scroll/sticky_landing.dart';

enum SideNavPosition { Left, Right }

class StickyWebScroll extends StatelessWidget {
  final Widget landing;
  final Widget body;
  final double height;
  final Widget sideNav;
  final Widget stickyAppBar;
  final double stickyHeight;
  final bool floating;
  final bool pinned;
  final ScrollController controller;
  final Axis scrollDirection;
  final ScrollPhysics physics;
  final bool reverse;
  final Clip clipBehavior;
  final String restorationId;
  final SideNavPosition sideNavPosition;

  const StickyWebScroll({
    Key key,
    @required this.body,
    @required this.landing,
    @required this.stickyAppBar,
    this.sideNav,
    this.height,
    this.stickyHeight,
    this.floating = true,
    this.pinned = true,
    this.controller,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scrollDirection,
    this.physics,
    this.reverse = false,
    this.sideNavPosition = SideNavPosition.Left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final initialHeight = screenSize.height * 0.5;
    return NestedScrollView(
      controller: controller,
      scrollDirection: scrollDirection,
      physics: physics,
      reverse: reverse,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      body: Row(
        children: [
          sideNavPosition == SideNavPosition.Left ? _sideNav() : SizedBox(),
          _buildBody(),
          sideNavPosition == SideNavPosition.Right ? _sideNav() : SizedBox()
        ],
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverPersistentHeader(
              floating: floating,
              pinned: pinned,
              delegate: StickyLanding(
                landingHeight: height ?? initialHeight,
                collapse: Container(
                  height: height ?? initialHeight,
                  child: landing,
                ),
                visibleChild: Container(
                  height: stickyHeight ?? 50,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }

  Widget _sideNav() => sideNav ?? Container();

  Widget _buildBody() => body;
}
