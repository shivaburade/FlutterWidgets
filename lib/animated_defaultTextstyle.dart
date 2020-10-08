
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AniDefaultTextStyle extends StatefulWidget{
  @override
  _AniDefaultTextStyleState createState() => _AniDefaultTextStyleState();

  
}

class _AniDefaultTextStyleState extends State<AniDefaultTextStyle> {

  bool boldText = false;
  double fontSize = 30;
  TextStyle textstyle;
  FontWeight fontWeight;
  FontStyle fontStyle;
  Color color = Colors.black;
  TextDecoration textDecoration;

  bool loop = false;
  bool loop2 = false;

  @override
  void initState(){
    textstyle = TextStyle(
    fontSize: fontSize,
    color: color
  );
  }

  void animateState(){
    setState(() {
      textstyle = TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
    );
    });
  }

animateRandomColorAndSize(){
  loop = false;
  fontSize = Random().nextDouble() * 50;
  generateRandomColor();
}

  getBoldText(){
    loop = false;
    fontStyle = FontStyle.normal;
    fontWeight = FontWeight.w900;
    animateState();
  }

  getItalicText(){
    loop = false;
    fontStyle = FontStyle.italic;
    fontWeight = FontWeight.normal;
    animateState();
  }

  increaseFontSize(){
    loop = false;
    fontSize += 4;
    animateState();
  }

  decreaseFontSize(){
    loop = false;
    fontSize -= 4;
    animateState();
  }

  generateRandomColor(){
    
    color = Color.fromARGB(
        255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

    animateState();
  }

  animatedLoop(){
    loop = !loop;
    fontWeight = FontWeight.w900;
    generateRandomColor();
  }

  endCallback(){
      fontWeight = boldText ? FontWeight.w900 : FontWeight.w100;
      boldText = !boldText;
      generateRandomColor();
  }


  animatedLoop2(){
    loop2 = !loop2;
    generateRandomColor();
  }

  endCallback2(){
      fontSize = Random().nextDouble() * 50;
      fontWeight = boldText ? FontWeight.w900 : FontWeight.w100;
      boldText = !boldText;
      generateRandomColor();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedDefaultTextStyle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              child: Text("Flutter"),
              style: textstyle, //Provide the textStyle you want to animate. 
              duration: Duration(milliseconds: 800),
              //onEnd: loop ? endCallback : null, //for button animatedLoop
              onEnd: loop2 ? endCallback2 : null, //for button animatedLoop2
              //curve: Curves.easeOut,
              //overflow: TextOverflow.clip,
              //softWrap: true,
              //textAlign: TextAlign.right,

            ),
            RaisedButton(onPressed: getItalicText, child: Text("Animate Italic")),
            RaisedButton(onPressed: getBoldText, child: Text("Animate Bold")),
            RaisedButton(onPressed: increaseFontSize, child: Text("Animate FontSize by +4")),
            RaisedButton(onPressed: decreaseFontSize, child: Text("Animate FontSize by -4")),
            RaisedButton(onPressed: generateRandomColor, child: Text("Animate Random Color")),
            RaisedButton(onPressed: animateRandomColorAndSize, child: Text("Animate Random Color & Size")),
            RaisedButton(onPressed: animatedLoop, child: Text("Animate Random Color & Bold Loop")),
            RaisedButton(onPressed: animatedLoop2, child: Text("Animate Random Color, Bold & Size Loop"))
          ],
        ),
      ),
    );
  }
}