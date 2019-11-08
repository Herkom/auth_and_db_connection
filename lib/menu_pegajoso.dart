import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

/// Menú desplegable animado ///
/// ------------------------ ///

class MenuPegajoso extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuPegajoso();
  }
}

class _MenuPegajoso extends State<MenuPegajoso>  with TickerProviderStateMixin{
  Size screenSize;
  String nombreAnimacion = 'seteo';
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
                ///
                Positioned(
                    top: screenSize.height*0.72,
                    left: distanciaIzquierda,
                    child: GestureDetector(
                      onTap: (){
                        var tempName = (nombreAnimacion == 'seteo' || nombreAnimacion == 'cerrar') ? 'abrir' : 'cerrar';
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