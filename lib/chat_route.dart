import 'package:flutter/material.dart';

import 'package:auth_and_db_connection/comentario_Fiscal.dart';
import 'package:auth_and_db_connection/comentario_Fiscal_conImagen.dart';
import 'package:auth_and_db_connection/comentario_simple.dart';
import 'custom_layout.dart';
import 'gradient_back.dart';

class ChatRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatRoute();
  }
}

class _ChatRoute extends State<ChatRoute>{
  Size screenSize;
  @override

  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Mensajes', style: TextStyle(fontSize: 20.0),),
        ),
        body:Stack(
          children: <Widget>[
            GradientBack( screenSize.height ),
            ListView(
              children: <Widget>[
                CustomLayout(
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
                              image: NetworkImage('http://www.osfetabasco.gob.mx/site/wp-content/themes/osfe/inc/slider/5-asech.jpg'),
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
                                              image: NetworkImage('https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large')
                                          )
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Alejandro Álvarez',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '18 de Noviembre 8:16 a.m.',
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
                                    'Extraordinaria participación de la comunidad tabasqueña en la propuesta de Ley para implementar nuestra app de transparencia en tiempo real Säc : Excelente Semana! Extraordinaria participación de la comunidad tabasqueña en la propuesta de Ley para implementar nuestra app de transparencia en tiempo real Säc : Excelente Semana! Extraordinaria participación de la comunidad tabasqueña en la propuesta de Ley para implementar nuestra app de transparencia en tiempo real Säc : Excelente Semana!',
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
                                      Icon(Icons.chat, color: Colors.grey,),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container( margin: EdgeInsets.only(right: 10.0), child: Text('256')),
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
                    ),
                    Container(
                      color: Colors.red,
                      width: 100.0,
                      height: 100.0,
                    ),
                  ],
                ),
                ComentarioFiscal(),
                ComentarioSimple(path:'https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2133&q=80', comentario:'¡Muy interesante!'),
                ComentarioSimple(path:'https://images.unsplash.com/photo-1512288094938-363287817259?ixlib=rb-1.2.1&auto=format&fit=crop&w=2133&q=80', comentario: '¡Qué bien!, un orgullo para nuestro Estado.'),
                ComentarioConImagen(),
                ComentarioSimple(path:'https://images.unsplash.com/photo-1542142860-60fbdf26b2d7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', comentario: 'Muy bien, a seguir trabajando'),
                ComentarioSimple(path:'https://images.unsplash.com/photo-1509380836717-c4320ccf1a6f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=e01c8c45a063daaf6d6e571a32bd6c90', comentario: 'Nunca lo hubieramos logrado sin nuestro jefe'),
                ComentarioSimple(path:'https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1372&q=80', comentario: 'El Fiscal es puto.'),
                ComentarioFiscal(),
                ComentarioSimple(path:'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', comentario: 'No es puto, es putísimo.'),
                ComentarioFiscal(),
              ],
            ),
          ],
        )
    );
  }
}