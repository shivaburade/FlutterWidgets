import 'dart:math';

import 'package:animation_tutorial/animated_container.dart';
import 'package:flutter/material.dart';
import './animated_builder.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.deepPurple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  AniContainer() //AniBuilder()   //MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double x = 0;
  double y = 0;
  var _alignment = Alignment.center;
  var _curve = Curves.bounceIn;

  Alignment getRandomAlignment(){
    var aligns = [
      Alignment.bottomRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft, 

      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,

      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight
    ];
    return aligns[Random().nextInt(aligns.length - 1)];
  }

  Curve getRandomCurve(){

    var curves = [
      Curves.bounceOut,
      Curves.bounceIn,
      Curves.bounceInOut,
      Curves.decelerate,
      Curves.ease,
      Curves.easeIn,
      Curves.easeInBack,
      Curves.easeInCirc,
      Curves.easeInCubic,
      Curves.easeInExpo,
      Curves.easeInOut,
      Curves.easeInOutBack,
      Curves.easeInOutCirc,
      Curves.easeInOutCubic,
      Curves.easeInOutExpo,
      Curves.easeInOutQuad,
      Curves.easeInOutQuart,
      Curves.easeInOutQuint,
      Curves.easeInOutSine,
      Curves.easeInQuad,
      Curves.easeInQuart,
      Curves.easeInQuint,
      Curves.easeInSine,
      Curves.easeInToLinear,
      Curves.easeOut,
      Curves.easeOutBack,
      Curves.easeOutCirc,
      Curves.easeOutCubic,
      Curves.easeOutExpo,
      Curves.easeOutQuad,
      Curves.easeOutQuart,
      Curves.easeOutQuint,
      Curves.easeOutSine,
      Curves.elasticIn,
      Curves.elasticInOut,
      Curves.elasticOut,
      Curves.fastLinearToSlowEaseIn,
      Curves.fastOutSlowIn,
      Curves.linear,
      Curves.linearToEaseOut,
      Curves.slowMiddle
    ]; //
    
    return curves[Random().nextInt(curves.length - 1)];
  }

  void _incrementCounter() {
    setState(() {
      x = Random().nextDouble()*2-1;// -1.0 - +1.0
      y = Random().nextDouble()*2-1;
      
      _alignment = getRandomAlignment();
      _curve = getRandomCurve();
      print(_alignment);
      print(_curve);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // horizontal).
          children: <Widget>[
            Text(
              'Touch the + button to move the box',
            ),
            
            Expanded(
              child: AnimatedAlign(
                //alignment: _alignment, 
                alignment: Alignment(x, y),
                curve: _curve,
                duration: Duration(seconds: 2), 
                child: SizedBox(
                  height: 100, width: 100, 
                  child: Container(color: Colors.amber,),
                ),
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
