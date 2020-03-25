import 'package:auth_and_db_connection/User/model/mensaje.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactosFrecuentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Contactos Frecuentes',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: Colors.blueGrey,
                  onPressed: null
                ),
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favoritos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/mensajes');},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage(favoritos[index].foto),
                        ),
                        SizedBox(height: 6.0,),
                        Text(
                          favoritos[index].nombre,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
