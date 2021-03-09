import 'package:flutter/material.dart';
import '../lib/sticky_web_scroll.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StickyWebScroll(
          landing: Container(),
          stickyAppBar: Container(),
          body: Container(),
        ),
      ),
    );
  }
}
