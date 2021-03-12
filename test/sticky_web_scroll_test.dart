import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sticky_web_scroll/sticky_web_scroll.dart';

void main() {
  testWidgets('sticky-web-scroll-test', (WidgetTester tester) async {
    final stickyScroll = StickyWebScroll(
      landingHeight: 200,
      stickyHeight: 80,
      landing: SizedBox(),
      stickyAppBar: SizedBox(),
      body: SizedBox(),
      pinned: true,
      floating: true,
      restorationId: 'test',
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.hardEdge,
      reverse: false,
    );

    expect(stickyScroll, equals(stickyScroll));
  });
}
