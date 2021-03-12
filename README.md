# sticky_web_scroll

Use this package if you need more customization on your web scroll displays.

See the [install instructions](https://pub.dev/packages/sticky_web_scroll/install).

## Quick reference

Since customization requires a lot of properties, here is a quick cheatsheet:

Property | What does it do
-------- | ---------------
landing    | Takes the 5% of the screen height, collasp when scrolled vertically.
body  | The body of the main content.
landingHeight  | The height of the landing to stickyAppbar point.
sideNav  | Side widget(optional).
stickyAppBar  | Immediate below landing, stick to top when landing collasp.
stickyHeight  | stickyAppBar, stickyAppBar height.

## We are on YouTube!

You can see a video tutorial here.
1.Awesome Flutter Tutorials [tutorial](https://www.youtube.com/channel/UC1fuQBjVLSqwk-PgdeeMAyQ) by **Flutter Developer's Core**

To use this package :

* add the dependency to your [pubspec.yaml](https://github.com/hello-paulvin/sticky-web-scroll/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    sticky_web_scroll: 
```

## Getting Started

The examples below were updated for version 0.0.1. Changes might have been made. See the [changelog](CHANGELOG.md).

## Screenshot

![sticky_web_scroll Animated](screenshots/screen1.gif.gif)

### A basic Sticky-Web-Scroll 

```dart

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StickyWebScroll(
        landingHeight: 400,
        stickyHeight: 80,
        landing: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1489843704329-b420d20a0b43?ixid=MXwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwyMzA0MDE1fHxlbnwwfHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                fit: BoxFit.cover),
          ),
        ),
        stickyAppBar: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text('Stick Web Scroll - by Flutter Devs Core',
                style: Theme.of(context).textTheme.headline4),
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: List.generate(
                100,
                (index) => Container(
                  height: 500,
                  width: 500,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

```
