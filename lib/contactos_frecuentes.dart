import 'package:auth_and_db_connection/User/model/mensaje.dart';
import 'package:auth_and_db_connection/pantalla_mensajes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactosFrecuentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.indigo.withAlpha(50),
      padding: const EdgeInsets.only(top:15.0),
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              //color: Colors.green,
              //alignment: Alignment.center,
              height: 35,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Frecuentes',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        icon: Icon(Icons.more_horiz),
                        iconSize: 30.0,
                        color: Colors.black26,
                        onPressed: (){}
                      ),
                    ),
                  ],
                ),
            ),
            Container(
              height: 120.0,
              child: ListView.builder(
                //padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favoritos.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){Navigator.pushNamed(context, PantallaMensajes.routeName, arguments: ScreenArguments(favoritos[index]));},
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        width: 70,
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(favoritos[index].foto),
                              backgroundColor: Colors.indigo.withAlpha(50),
                            ),
                            SizedBox(height: 6.0,),
                            Text(
                              favoritos[index].nombre,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
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
