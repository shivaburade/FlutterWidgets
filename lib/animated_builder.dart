import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AniBuilder extends StatefulWidget{
  @override
  _AniBuilderState createState() => _AniBuilderState();
}

class _AniBuilderState extends State<AniBuilder> with TickerProviderStateMixin {

  AnimationController _controller;
  bool start = true;
  double dx = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =  AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
    
  }

  void toggle(){
    
    setState(() {
      start = !start;
      if(start)
        _controller.repeat(); //_controller.forward()
      else
        _controller.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedBuilder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Animated Builder Example"), 
           AnimatedBuilder(
              animation: _controller,
              child:  Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: FlatButton(onPressed: toggle
                , child: Text("Stop Scaling")),
              ), 
              builder: (context, child){
                return  Transform.scale(
                   scale: _controller.value,
                   child: child,
                );
              },
          ),
          AnimatedBuilder(
              animation: _controller,
              child:  Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: FlatButton(onPressed: toggle
                , child: Text("Stop Flipping")),
              ), 
              builder: (context, child){
                return Transform(transform: Matrix4.rotationX(_controller.value * 2 * math.pi),alignment: Alignment.bottomRight ,child: child,);
              },
          ), 
          AnimatedBuilder(
              animation: _controller,
              child:  Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: FlatButton(onPressed: toggle
                , child: Text("Stop rotating")),
              ), 
              builder: (context, child){
                return Transform.rotate(angle: _controller.value * 2*  math.pi, child: child,);
                //return Transform.translate(offset: Offset(_controller.value * 100, 0), child: child);
                
              },
          ), 
          AnimatedBuilder(
              animation: _controller,
              child:  Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: FlatButton(onPressed: toggle
                , child: Text("Stop translate")),
              ), 
              builder: (context, child){
                return Transform.translate(offset: Offset(_controller.value * 250, 0), child: child);
              },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: toggle, child: Icon(Icons.autorenew),),
    );
  }
}

  
