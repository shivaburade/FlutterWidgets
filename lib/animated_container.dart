import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:matrix4_transform/matrix4_transform.dart';


class AniContainer extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AniContainer> {
  bool heightWidthFlag = false;
  bool borderRadius = false;
  bool heartbeatFlag = false;
  bool translateFlag = false;
  bool aflag = false;

  var animatedWithHeight = Text("My Height and width will start animating upon click");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void animateHeightWidth(){
    setState(() {
      animatedWithHeight = Text("");
      heightWidthFlag = !heightWidthFlag;
    });
  }

  void animateBorderRadius(){
    setState(() {
      borderRadius = !borderRadius;
    });
  }

  void animatedHeartbeatFlag(){
    setState(() {
      heartbeatFlag = !heartbeatFlag;
    });
  }

  void animatedtranslateFlag(){
    setState(() {
      translateFlag = !translateFlag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment : CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: animateHeightWidth,
              child: AnimatedContainer(
              duration: Duration(seconds: 2),
              height: heightWidthFlag ? 125 : 75,
              width: heightWidthFlag ? 185 : 75,
              color: Colors.amber,
              onEnd: () {
                setState(() {
                  if (heightWidthFlag)
                  animatedWithHeight = Text("animated Height and Width");
                  else
                  animatedWithHeight = Text("Click Me");
                });
              },
              child: animatedWithHeight,
              padding: EdgeInsets.all(10),
              curve: Curves.easeInCirc,
              ),
            ),

            GestureDetector(
              onTap: animateBorderRadius,
              child: AnimatedContainer(
              duration: Duration(seconds: 2),
              height: 150,
              width: borderRadius ? 250 : 150,
              decoration: BoxDecoration(
                borderRadius: borderRadius ? BorderRadius.all(Radius.circular(190))  : BorderRadius.all(Radius.circular(0)) ,
                color: Colors.amber
              ),
              alignment: Alignment.center,
              child: Text("Border Radius & Width Animation"),
              curve: borderRadius ? Curves.easeInCirc : Curves.easeOutCirc,
              ),
            ),

            GestureDetector(
              onTap: animatedHeartbeatFlag,
              child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: heartbeatFlag ? 165 : 160,
              width: heartbeatFlag ? 165 : 160,
              decoration: BoxDecoration(
                color: heartbeatFlag ? Colors.amber : Colors.amberAccent,
                shape: BoxShape.circle
              ),
              //color: Colors.amber,
              onEnd: animatedHeartbeatFlag,
              padding: EdgeInsets.all(10),
              alignment: AlignmentDirectional.center,
              child: Text("HeartBeat Animations"),
              curve: Curves.easeInCirc,
              ),
            ), 

            GestureDetector(
              onTap: animatedtranslateFlag,
              child: AnimatedContainer(
              duration: Duration(seconds: 2),
              height: 150,
              width:145,
              transform:  translateFlag ? Matrix4Transform().translateOffset(Offset(150, 0)).matrix4 : Matrix4Transform().translateOffset(Offset(0, 0)).matrix4,
              decoration: BoxDecoration(
                color: translateFlag ? Colors.amber : Colors.amberAccent,
                shape: translateFlag ? BoxShape.circle : BoxShape.rectangle
              ),
              //color: Colors.amber,
              onEnd: animatedtranslateFlag,
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.all(10),
              child: Text("Shape & Translate Animations"),
              curve: Curves.easeInCirc,
              ),
            )
            
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: changeAnimation, child: Icon(Icons.plus_one),)
    );
  }
}