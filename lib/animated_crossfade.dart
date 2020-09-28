import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class AniCrossFade extends StatefulWidget
{
  @override
  _AniCrossFadeState createState() => _AniCrossFadeState();
}

class _AniCrossFadeState extends State<AniCrossFade> {
  bool state = true;
  int counter = 0;
  Timer stopwatch;
changeState(){
  setState(() {
    state = !state;
  });

 
  if(!state){
     stopwatch = Timer.periodic(Duration(seconds: 1), (stopwatch){
       setState(() {
         counter = counter + 1;
         if(counter == 11){
           stopwatch.cancel();
           counter = 0;
           state = !state;
         }
       });
     });
   }else{
     stopwatch.cancel();
   }
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Crossfade"),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Counter : " + counter.toString(), style: TextStyle(fontSize: 30),)
              ),
              LinearProgressIndicator(
                value: counter/10,
              ),
            Expanded(
               child: Center(
                 child: AnimatedCrossFade(
                      firstChild: Container(
                        child: IconButton(icon: Icon(Icons.play_arrow), color: Colors.deepPurple, onPressed: changeState, iconSize: 250, splashColor: Colors.transparent, highlightColor: Colors.transparent ),
                      ), 
                      secondChild: Container(
                        child: IconButton(icon: Icon(Icons.pause), color: Colors.deepPurple, onPressed: changeState, iconSize: 250, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                      ), 
                      crossFadeState: state ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
                      firstCurve: Curves.easeInCubic, //optional
                      secondCurve: Curves.easeInCubic, //optional
                      duration: Duration(seconds: 1)
                      ),
               ),
              ) 
              
          ],
        ),
      ),
    );
  }
}
  
