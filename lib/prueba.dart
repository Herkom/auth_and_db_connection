import 'package:auth_and_db_connection/gradient_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Prueba extends StatelessWidget{

  double screenHeight;
  double screenWidth;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(screenHeight),
        ListView(
          padding: EdgeInsets.symmetric( vertical: 50.0 ),
          children: <Widget>[
            Container(
              color: Colors.brown.withAlpha(100),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: screenWidth/2,
                    height: screenHeight/4,
                    color: Colors.amber,
                  ),
                  Positioned(
                    top: 100,
                    left: 50,
                    child: Container(
                      width: screenWidth/3,
                      height: screenHeight/6,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Positioned(
                    top: 130,
                    right: 50,
                    child: Container(
                      width: screenWidth/4,
                      height: screenHeight/8,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.center,
              height: 300,
              color: Colors.purple.withAlpha(100),
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 80,
                color: Colors.purpleAccent,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints.loose(Size(200,200)),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: screenWidth*0.8,
              height: 80,
              color: Colors.teal,
              child: Container(
                width: 100,
                height: 200,
                color: Colors.deepOrangeAccent,
              )
            ),
          ],
        )
      ],
    );
  }
}

