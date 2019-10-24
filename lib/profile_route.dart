import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

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
        Shalala(),
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




/// Menú desplegable animado ///
/// ------------------------ ///

class Shalala extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Shalala();
  }
}

class _Shalala extends State<Shalala>  with TickerProviderStateMixin{
  Size screenSize;
  String nombreAnimacion = 'cerrar';
  double distanciaIzquierda;

  AnimationController _controller;
  Animation<double> animation;
  final double anchoComienzo = 0.85;
  final double anchoTermino = 0.0;


  /// Settings de la animación ///
  /// ------------------------------------------ ///
  @override
  void initState() {
    super.initState();                           //Duration puede tener horas, minutos, dias, milisegundos, etc.
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    animation = Tween<double>(begin: anchoComienzo, end: anchoTermino).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    screenSize = MediaQuery.of(context).size;
    distanciaIzquierda = screenSize.width-(screenSize.width/7);


    /// AnimatedBuilder nos da la funcionalidad de animación usando el _controller de arriba ^^^ ///
    /// ---------------------------------------------------------------------------------------- ///
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, anim){
        return ClipPath(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: screenSize.width*0.75,
                  height: screenSize.height,
                  //color: Colors.blue.withAlpha(50),

                  /// Esto es lo que trae la animación a Flutter ///
                  /// ------------------------------------------ ///
                  // El FlareActor responde directamente a las medidas de su padre.
                  child: FlareActor(
                    'assets/animations/tuts.flr',
                    alignment: Alignment.centerRight,
                    fit: BoxFit.contain,
                    animation: nombreAnimacion,
                  ),
                )
              ),



              // Debo hacer que solo usemos un solo Container y que su posición se anime.

              /// Las areas que disparan la animación ///
              /// ------------------------------------------ ///
              Positioned(
                top: screenSize.height*0.72,
                left: distanciaIzquierda,
                child: GestureDetector(
                  onTap: (){
                    var tempName = (nombreAnimacion == 'cerrar') ? 'abrir' : 'cerrar';
                    setState(() {
                      nombreAnimacion = tempName;
                      _controller.forward(from: 0.0);
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: screenSize.width/7,
                    height: 130,
                  ),
                )
              ),
              Positioned(
                  top: screenSize.height*0.72,
                  left: screenSize.width*0.25,
                  child: GestureDetector(
                    onTap: (){
                      var tempName = (nombreAnimacion == 'cerrar') ? 'abrir' : 'cerrar';
                      setState(() {
                        nombreAnimacion = tempName;
                        _controller.animateBack(0.0, duration: Duration(milliseconds: 700));
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: screenSize.width/7,
                      height: 170,
                    ),
                  )
              )
            ],
          ),
          clipper: ElClipper(animation.value),
        );
      }
    );
  }
}


/// El trazado de la máscara ///
/// ------------------------ ///
class ElClipper extends CustomClipper<Path>{

  final double medida;
  ElClipper(this.medida);

  @override
  Path getClip(Size size) {
    var elPath = Path();
    elPath.moveTo(size.width, 0.0);
    elPath.lineTo(size.width, size.height);
    elPath.lineTo(size.width*medida, size.height);
    elPath.lineTo(size.width*medida, 0.0);
    elPath.close();

    return elPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}