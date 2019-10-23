import 'profile_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_route.dart';
import 'onboarding_page.dart';
import 'dashboard_route.dart';
import 'botonera_route.dart';
import 'demo_objetoDraggable.dart';
import 'demo_animateContainer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSFE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: '/',
        routes: {
          '/contenedorAnimado': (context) => DemoAnimateContainer(),
          '/objetoDraggable': (context) => DemoDraggable(),

          '/': (context) => OnboardingPage(),
          '/login': (context) => LoginRoute(),
          '/botonera': (context) => BotoneraRoute(),
          '/dashboard': (context) => DashboardRoute(),
          '/perfil': (context) => ProfileRoute(),
        }
    );
  }
}