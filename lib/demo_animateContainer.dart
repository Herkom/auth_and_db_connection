import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoAnimateContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainerApp()
    );
  }
}

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {

  // --------- SETEO DE VARIABLES ---------
  // --------------------------------------
  // --------------------------------------
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  double _fontSize = 10;
  double _margin = 10;
  // --------------------------------------
  // --------------------------------------
  // --------------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: Center(



          // ---------- Este es el Container a animar -----------
          // ----------------------------------------------------
          // ----------------------------------------------------
          // AnimatedContainer es el Widget de Container que se puede animar.
          // Container no tiene los parámetros de duration y curve.
          // ----------------------------------------------------
          // ----------------------------------------------------
          child: AnimatedContainer(
            // Use the properties stored in the State class.
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            // Define how long the animation should take.
            duration: Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(_margin),
                child: Text(
                  'shalala',
                  style: TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
          // ----------------------------------------------------
          // ----------------------------------------------------
          // ----------------------------------------------------





        // ---------- Este botón activa la animación ----------
        // ----------------------------------------------------
        // ----------------------------------------------------

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          // When the user taps the button
          onPressed: () {
            // Use setState to rebuild the widget with new values.
            setState(() {
              // Create a random number generator.
              final random = Random();

              // Generate a random width and height.
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              _fontSize = (_width + _height) / 10;
              _margin = (_width + _height) / 30;

              // Generate a random color.
              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // Generate a random border radius.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
        ),
        // ----------------------------------------------------
        // ----------------------------------------------------
        // ----------------------------------------------------

      ),
    );
  }
}