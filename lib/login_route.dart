import 'package:auth_and_db_connection/profile_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:auth_and_db_connection/User/model/user.dart';
import 'User/bloc/user_bloc.dart';
import 'custom_button.dart';
import 'gradient_back.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {

  final _controllerUserNumber = TextEditingController();
  final _controllerUserPassword = TextEditingController();

  UserBloc userBloc;

  double screenHeight;
  double screenWidth;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    userBloc = BlocProvider.of(context);

    //return _manejarSesionActual();
    return appLogin();
  }

  /*Widget _manejarSesionActual(){
    return StreamBuilder(
      //stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError ){
          return appLogin();
        } else {
          Navigator.pushNamed(context, '/perfil');
          return null;
        }
      },
    );
  }*/

  Widget appLogin() {
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack(),
            ListView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.35,
                    alignment: Alignment.center,
                    child: Image(
                      width: screenWidth * 0.6,
                      image: AssetImage('assets/img/OSFElogo.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
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
                              controller: _controllerUserNumber,
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
                              controller: _controllerUserPassword,
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

                          ///Este era el boton que llamaba a la SnackBar, recuerda el rollo del Builder - Context del Scaffold
                          /*CustomButton(
                                  text: 'Existo?',
                                  onPressed: (){
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('HHHHHH'),
                                        )
                                    );
                                  },
                                  height: 50,
                                ),*/

                          CustomButton(
                            text: 'Entrar',
                            onPressed: () {
                              userBloc.signOut();

                              Future<Usuario> user = userBloc.signIn(_controllerUserNumber.text, _controllerUserPassword.text);
                              user.then((Usuario empleado){
                                empleado.status == 1 ?
                                  Navigator.pushNamed(context, ProfileRoute.routeName, arguments: ScreenArguments(empleado.nombre,empleado.foto,empleado.unidadAdministrativa,empleado.claveInterna) )
                                : user = null;
                              });
                            },
                            height: 50,
                            colorLeft: Color(0xFFa7ff84),
                            colorRight: Color(0xFF1cbb78),
                            width: screenWidth / 2,
                            fontSize: 22.0,
                          ),

                          Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Column(
                                children: <Widget>[
                                  /*Text(
                                    'Si eres trabajardor del OSFE\n pero no tienes cuenta',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 7.0),
                                    child: FlatButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 15.0),
                                      color: Color(0xFF040050),
                                      textColor: Colors.white,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/registrate');
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      child: Text(
                                        'Registrate',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          decorationThickness: 2.85,
                                        ),
                                      ),
                                    ),
                                  ),*/
                                  Text(
                                    'o accede de forma pública',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,),
                                  ),

                                  /// Lleva a la botonera
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 7.0),
                                    child: FlatButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 15.0),
                                      color: Color(0xFF040050),
                                      textColor: Colors.white,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/botonera');
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      child: Text(
                                        'Acceso Público',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          decorationThickness: 2.85,
                                        ),
                                      ),
                                    ),
                                  ),
                                  /// Lleva al chat
                                  GestureDetector(
                                    onLongPress: (){Navigator.pushNamed(context, '/chatAvanzado');},
                                    child: Container(
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
                                  ),
                                  /// Era el experimento del Container y texto animados
                                  /*Container(
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
                                            ),*/

                                  /// Era el logo de Flutter que se podía arrastrar
                                  /*Container(
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
                                            ),*/
                                  /// Lleva a la botonera
                                            /*Container(
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
                                            ),*/

                                            ///Esto era la prueba de alineaciones
                                  /*Container(
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
                                            ),*/
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