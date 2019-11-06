import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'button_green.dart';
import 'gradient_back.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {

  double screenHeight;
  double screenWidth;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack( screenHeight ),
            ListView(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
                children: <Widget>[
                  Container(
                    height: screenHeight*0.35,
                    alignment: Alignment.center,
                    child: Image(
                      width: screenWidth*0.6,
                      image: AssetImage('assets/img/OSFElogo.png'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 15.0, left: 25.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Acceder',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Número de empleado',
                                hasFloatingPlaceholder: false,
                                labelText: 'Usuario',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                hasFloatingPlaceholder: false,
                                labelText: 'Contraseña',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ButtonGreen(
                            text: 'Entrar',
                            onPressed: (){
                              Navigator.pushNamed(context, '/perfil');
                            },
                            height: 50,
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 40.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Si no tienes cuenta puedes registrarte \n o acceder de forma anónima',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white,),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:15.0, horizontal: 7.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                        color: Color(0xFF040050),
                                        textColor: Colors.white,
                                        onPressed: (){Navigator.pushNamed(context, '/contenedorAnimado');},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          'Registrate',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            decorationThickness: 2.85,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:15.0, horizontal: 7.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                        color: Color(0xFF040050),
                                        textColor: Colors.white,
                                        onPressed: (){Navigator.pushNamed(context, '/objetoDraggable');},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          'Registrate',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            decorationThickness: 2.85,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:15.0, horizontal: 7.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                        color: Color(0xFF040050),
                                        textColor: Colors.white,
                                        onPressed: (){Navigator.pushNamed(context, '/botonera');},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          'Anónimo',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            decorationThickness: 2.85,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:15.0, horizontal: 7.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                        color: Color(0xFF040050),
                                        textColor: Colors.white,
                                        onPressed: (){Navigator.pushNamed(context, '/chat');},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          'Chat',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            decorationThickness: 2.85,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(vertical:15.0, horizontal: 7.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                        color: Color(0xFF040050),
                                        textColor: Colors.white,
                                        onPressed: (){Navigator.pushNamed(context, '/prueba');},
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          'Prueba',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            decorationThickness: 2.85,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
            )
          ],
        )
    );
  }
}