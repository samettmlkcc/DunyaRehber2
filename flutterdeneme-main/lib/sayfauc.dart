import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mobilprogramlama_1/graphs.dart';

class sayfauc extends StatefulWidget {
  String value;
  sayfauc({this.value});
  @override
  _sayfaucState createState() => _sayfaucState(value: value);
}

class _sayfaucState extends State<sayfauc> with SingleTickerProviderStateMixin {
  String value;
  _sayfaucState({this.value});
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
          angle: animationController.value,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Image.asset(value),
          )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => graphs()));
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Go Graph'),
        ),
      ),
    );
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
