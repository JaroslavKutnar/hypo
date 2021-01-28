import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hypo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hypo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) return portraitMode();
        return landscapeMode();
      }),
    );
  }

  Widget portraitMode() {
    return Column(children: [
      AspectRatio(
        aspectRatio: 6,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getButtons()),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.red,
          alignment: Alignment.center,
        ),
      )
    ]);
  }

  Widget landscapeMode() {
    return Row(children: [
      AspectRatio(
        aspectRatio: 1 / 6,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getButtons() + [AspectRatio(aspectRatio: 1 / 2)]),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.red,
          alignment: Alignment.center,
        ),
      )
    ]);
  }

  List<Widget> getButtons() {
    return [
      Container(
        child: Image.asset("assets/images/hypo.png", fit: BoxFit.cover),
        // padding: EdgeInsets.all(10.0),
      ),
      Container(
        child: Image.asset("assets/images/savings.png"),
        // padding: EdgeInsets.all(10.0)
      ),
      Container(
        child: Image.asset("assets/images/result.png"),
        //padding: EdgeInsets.all(10.0)
      )
    ];
  }
}
