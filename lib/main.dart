//import 'package:auth_and_db_connection/prueba.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'User/bloc/user_bloc.dart';
import 'chat_route.dart';
//import 'profile_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_route.dart';
import 'onboarding_page.dart';
//import 'dashboard_route.dart';
import 'botonera_route.dart';
//import 'demo_objetoDraggable.dart';
//import 'demo_animateContainer.dart';
//import 'registro_route.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'OSFE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          //'/contenedorAnimado': (context) => DemoAnimateContainer(),
          //'/objetoDraggable': (context) => DemoDraggable(),
          '/': (context) => OnboardingPage(),
          '/login': (context) => LoginRoute(),
          '/botonera': (context) => BotoneraRoute(),
          //'/dashboard': (context) => DashboardRoute(),
          //'/registrate': (context) => RegistroRoute(),
          //ProfileRoute.routeName: (context) => ProfileRoute(),
          '/chat': (context) => ChatRoute(),
          //'/prueba': (context) => Prueba(),
        }
      )
    );
  }
}