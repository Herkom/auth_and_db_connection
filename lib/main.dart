import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_flare/enums.dart';
import 'package:smart_flare/smart_flare.dart';

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
        }
    );
  }
}



class Shalala extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      child: Align(
        alignment: Alignment.centerRight,
        child: PanFlareActor(
          width: 132.5,
          height: screenSize.height,
          filename: 'assets/animations/tuts.flr',
          openAnimation: 'open',
          closeAnimation: 'close',
          direction: ActorAdvancingDirection.RightToLeft,
          threshold: 20.0,
          reverseOnRelease: false,
          completeOnThresholdReached: false,
          activeAreas: [
            RelativePanArea(
                area: Rect.fromLTWH(0, 0.7, 1.0, 0.3),
                debugArea: false
            )
          ],
        ),
      ),
    );
  }
}
