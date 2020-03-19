import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget{

  final String text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;
  Color colorLeft;
  Color colorRight;
  double fontSize = 18.0;
  CustomButton({Key key, @required this.text, @required this.onPressed, this.height, this.width, this.colorLeft, this.colorRight, this.fontSize});

  @override
  State createState() {
    // TODO: implement createState
    return _CustomButton();
  }
}

class _CustomButton extends State<CustomButton>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                colors: [
                  widget.colorLeft,//Color izquierda
                  widget.colorRight//Color derecha
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: widget.fontSize,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}