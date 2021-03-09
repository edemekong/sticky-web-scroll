# sticky_web_scroll

Use this package if you need more customization on your web scroll displays.

See the [install instructions](https://pub.dev/packages/sticky_web_scroll/install).

## Quick reference

Since customization requires a lot of properties, here is a quick cheatsheet:

Property | What does it do
-------- | ---------------
landing    | Takes the 5% of the screen height, collasp when scrolled vertically.
body  | The body of the main content.
height  | The height of the landing to stickyAppbar point.
sideNav  | Side widget(option).
stickyAppBar  | Immediate below landing, stick to top when landing collasp.
stickyHeight  | stickyAppBar, stickyAppBar height.

## We are on YouTube!

You can see a video tutorial here.
1. Flutter Tutorials [tutorial](https://www.youtube.com/channel/UC1fuQBjVLSqwk-PgdeeMAyQ) by **Paul Edeme'kong**

## Getting Started

The examples below were updated for version 0.0.1. Changes might have been made. See the [changelog](CHANGELOG.md).

### A basic Sticky-Web-Scroll 

```dart
class YourClassName extends StatelessWidget {
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
```