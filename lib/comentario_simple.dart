import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComentarioSimple extends StatelessWidget{
  String path;
  String comentario;
  double screenWidth;

  ComentarioSimple({Key key, @required this.path, @required this.comentario});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(path)
              )
            ),
          ),



          Container(
            constraints: BoxConstraints(
              maxWidth: screenWidth/2,
              minWidth: 50
            ),
            padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 18.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              comentario,
              style: TextStyle(
                fontSize: 13.0
              ),
            )
          )
        ],
      ),
    );
  }
}



  
