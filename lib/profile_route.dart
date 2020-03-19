
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';


//import 'menu_pegajoso.dart';

class ScreenArguments {
  final String nombre;
  final String foto;
  final String uA;
  final int claveInterna;

  ScreenArguments(this.nombre, this.foto, this.uA, this.claveInterna);
}

class ProfileRoute extends StatelessWidget{
  static const routeName = '/perfil';
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
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
                delegate: SliverUsuario(expandedHeight: screenHeight*0.6, args: args),
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
                      child: Column(
                        children: <Widget>[
                          Text(
                            args.uA,
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            args.claveInterna.toString(),
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lato',
                              fontSize: 20,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
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


        /// ------------------------------------------ ///
        //MenuPegajoso(),
        /// ------------------------------------------ ///


      ],
    );
  }
}



/// Sliver con la foto de Usuario ///
/// ------------------------------------------ ///
class SliverUsuario extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final ScreenArguments args;

  SliverUsuario({@required this.expandedHeight, @required this.args});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Image.network(
          //'https://image.freepik.com/free-photo/blurred-background-blur-people-walking-street-shopping-center_7190-926.jpg'
          //'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwthzrwHJ47Ab89iNikRDNzhmK1ShBuOYRJNZDnCuEohUEn6Fh'
          //'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSNiDH-zgvte28gAty4KhFK2CsC-eE1wcGilixX8Dk4ZreKpMp1'
          //No se ve tan chido 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQAR28KiPD6Y3b2c4APuNEVzZe2nmFeUvCn7vVrCtCKppu2nXbO'
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ64aLfwL0UYQubyJ4lXg5x0z-i6eCraNUuCLO9y7vZ38WqxmSu'
          ,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        Container(
          child: Image.network(
            'http://200.56.118.28/${args.foto.substring(21)}',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          bottom: 50.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              args.nombre,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
                fontSize: 25,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
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




