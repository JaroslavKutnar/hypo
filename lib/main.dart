import 'package:flutter/material.dart';
import 'package:hypo/widgets/HypoPage.dart';
import 'package:hypo/widgets/ResultPage.dart';
import 'package:hypo/widgets/SavingsPage.dart';

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
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
          bodyText1: TextStyle(fontSize: 16.0, color: Colors.black54),
        ),
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
      resizeToAvoidBottomInset: false,
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
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getButtons()),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Container(
                key: UniqueKey(),
                child: getPage(),
              )),
        ),
      )
    ]);
  }

  Widget landscapeMode() {
    return Row(children: [
      AspectRatio(
        aspectRatio: 1 / 6,
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(right: BorderSide(color: Colors.grey))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getButtons() + [AspectRatio(aspectRatio: 1 / 2)]),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.white,
          //alignment: Alignment.center,
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Container(
                key: UniqueKey(),
                child: getPage(),
              )),
        ),
      )
    ]);
  }

  Widget getPage() {
    switch (_selectedPage) {
      case 1:
        return SavingsPage();
      case 2:
        return ResultPage();
      default:
        return HypoPage();
    }
  }

  List<Widget> getButtons() {
    return [
      GestureDetector(
        onTap: () {
          if (_selectedPage != 0)
            setState(() {
              _selectedPage = 0;
            });
        },
        child: Image.asset(
          "assets/images/hypo.png",
          color: (_selectedPage == 0) ? null : Colors.white,
          colorBlendMode: BlendMode.saturation,
        ),
      ),
      GestureDetector(
        onTap: () {
          if (_selectedPage != 1)
            setState(() {
              _selectedPage = 1;
            });
        },
        child: Image.asset(
          "assets/images/savings.png",
          color: (_selectedPage == 1) ? null : Colors.white,
          colorBlendMode: BlendMode.saturation,
        ),
      ),
      GestureDetector(
        onTap: () {
          if (_selectedPage != 2)
            setState(() {
              _selectedPage = 2;
            });
        },
        child: Image.asset(
          "assets/images/result.png",
          color: (_selectedPage == 2) ? null : Colors.white,
          colorBlendMode: BlendMode.saturation,
        ),
      )
    ];
  }
}
