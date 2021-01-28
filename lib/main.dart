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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hypo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

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
          color: Colors.white,
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
          color: Colors.white,
          alignment: Alignment.center,
        ),
      )
    ]);
  }

  List<Widget> getButtons() {
    return [
      GestureDetector(
        onTap: () {
          setState(() {
            _selectedPage = 0;
          });
        },
        child: Image.asset(
          "assets/images/hypo.png",
          color: (_selectedPage == 0) ? null : Colors.white,
          colorBlendMode: BlendMode.saturation,
        ),
        // padding: EdgeInsets.all(10.0),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            _selectedPage = 1;
          });
        },
        child: Image.asset(
          "assets/images/savings.png",
          color: (_selectedPage == 1) ? null : Colors.white,
          colorBlendMode: BlendMode.saturation,
        ),
        // padding: EdgeInsets.all(10.0)
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            _selectedPage = 2;
          });
        },
        child: Image.asset(
          "assets/images/result.png",
          color: (_selectedPage == 2) ? null : Colors.white,
          colorBlendMode: BlendMode.saturation,
        ),
        //padding: EdgeInsets.all(10.0)
      )
    ];
  }
}
