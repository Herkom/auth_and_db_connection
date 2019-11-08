
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'menu_pegajoso.dart';

class ProfileRoute extends StatelessWidget{
  double screenHeight;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,

          /// CustomScrollView nos permite tener el
          /// Sliver de Usuario y el Sliver de tarjetas al mismo tiempo ///
          /// --------------------------------------------------------- ///
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: SliverUsuario(expandedHeight: screenHeight*0.6),
                pinned: false,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin: EdgeInsets.all(20.0),
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(40),
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(60),
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(80),
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        MenuPegajoso(),
      ],
    );
  }
}



/// Sliver con la foto de Usuario ///
/// ------------------------------------------ ///
class SliverUsuario extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  SliverUsuario({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.asset(
          'assets/img/fotoChicaPerfil.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        Positioned(
          bottom: 50.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              "Valeria Shoening",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 30,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),

        // Position crea la barra superior redondeada del Sliver ///
        // Esto al final es un 'hack' de UI, no debería de ser así ///
        // ------------------------------------------ ///
        Positioned(
          // El -0.1 quita esa pequeña linea transparente
          // que queda entre el Sliver de Usuario y el SliverList
          bottom: -0.1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
            ),
          )
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}




