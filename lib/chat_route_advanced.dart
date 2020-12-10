import 'package:auth_and_db_connection/selector_categorias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chats_recientes.dart';
import 'contactos_frecuentes.dart';

class ChatRouteAdvanced extends StatefulWidget {
  @override
  _ChatRouteAdvancedState createState() => _ChatRouteAdvancedState();
}

class _ChatRouteAdvancedState extends State<ChatRouteAdvanced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){Navigator.pushNamed(context, '/login');}
        ),
        /*title: Text(
          'Mensajes',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold
          ),
        ),*/
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: (){}
          ),
        ],
      ),
      body: Column(
        children: <Widget>[

          SelectorCategorias(),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)
                ),
              ),
              child: Column(
                children: <Widget>[
                  ContactosFrecuentes(),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,top: 10.0, bottom: 12.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recientes',
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ChatsRecientes(),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

