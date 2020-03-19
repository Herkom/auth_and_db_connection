import 'dart:io';

import 'package:flutter/material.dart';
import 'custom_layout.dart';


class ComentarioConImagen extends StatelessWidget{
  Size screenSize;

  String nombre;
  String fotoPerfil;
  String date;
  String contenido;
  File imagen;
  String imagenPath;
  int likes;

  ComentarioConImagen({ this.fotoPerfil, this.contenido, this.nombre, this.date, this.likes, this.imagen, this.imagenPath});

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return CustomLayout(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: Colors.white,
                elevation: 10.0,
                margin: EdgeInsets.only(top:15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imagenPath.contains('Pictures' ) ? FileImage(imagen) : NetworkImage(imagenPath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: screenSize.height/4,
                  width: screenSize.width*0.9,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: (screenSize.height/4)-20 ),
              alignment: Alignment.topCenter,
              child: Card(
                color: Colors.white,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 10.0),
                  width: screenSize.width*0.85,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 15.0),
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(fotoPerfil)
                                  )
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  nombre,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  date,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black38
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          padding: EdgeInsets.all(1.0),
                          child: Text(
                            contenido,
                            style: TextStyle(
                              height: 1.3,
                            ),
                          )
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: Colors.grey.withAlpha(100),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 5.0, left: 5.0, top: 10, bottom: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.grey,
                                ),
                                onTap: (){
                                  print('');
                                  //setState(() {});
                                },
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container( margin: EdgeInsets.only(right: 10.0), child: Text('$likes')),
                                    Icon(Icons.favorite, color: Colors.grey,)
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          color: Colors.red,
          width: 50.0,
          height: 50.0,
        ),
      ],
    );
  }
}