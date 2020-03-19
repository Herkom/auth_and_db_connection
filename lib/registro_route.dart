import 'package:flutter/material.dart';
import 'gradient_back.dart';

class RegistroRoute extends StatefulWidget {
  @override
  _RegistroRouteState createState() => _RegistroRouteState();
}

class _RegistroRouteState extends State<RegistroRoute> {

  double screenHeight;
  double screenWidth;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(),
         ListView(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30.0),
            children: <Widget>[
               Container(
                height: screenHeight * 0.2,
                alignment: Alignment.center,
                child: Image(
                  width: screenWidth * 0.5,
                  image: AssetImage('assets/img/OSFElogo.png'),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 15.0, left: 25.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Registro',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextFormField(
                      controller: null,
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
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
