import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ComentarioFiscal extends StatelessWidget{
  double screenWidth;
  double screenHeight;

  String nombre;
  String fotoPerfil;
  String date;
  String contenido;
  int likes;

  ComentarioFiscal({ this.fotoPerfil, this.contenido, this.nombre, this.date, this.likes});

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
            width: screenWidth*0.8,
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: screenWidth*0.58,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black38
                          ),
                        ),
                        Text(
                          nombre,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Text(
                            contenido,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 15.0,
                              color: Colors.black.withAlpha(170)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Colors.grey.withAlpha(100),
                      indent: 25.0,
                      endIndent: 25.0,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.chat, color: Colors.grey,),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text('$likes'),
                                  Icon(Icons.favorite, color: Colors.grey,)
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                  ]
              ),
            ),
          ),
        Positioned(
          top: 35.0,
          left: 15.0,
          child: Container(
            height:120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(fotoPerfil),
                fit: BoxFit.cover,
              )
            ),
          )
        ),
      ],
    );
  }
}