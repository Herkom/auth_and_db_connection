import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_flare/enums.dart';
import 'package:smart_flare/smart_flare.dart';
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
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: MySliverAppBar(expandedHeight: screenHeight*0.6),
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

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

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
        Positioned(
          bottom: 0.0,
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




class Shalala extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Shalala();
  }
}

class _Shalala extends State<Shalala>{
  bool tapped;
  @override
  Widget build(BuildContext context){

    var screenSize = MediaQuery.of(context).size;
    tapped = true;

    return Container(
      width: screenSize.width,
      alignment: Alignment.centerRight,
      child: ClipPath(
        child: PanFlareActor(
          width: 265.0,
          height: screenSize.height,
          filename: "assets/animations/tuts.flr",
          openAnimation: 'abrir',
          closeAnimation: 'cerrar',
          direction: ActorAdvancingDirection.RightToLeft,
          threshold: 20.0,
          reverseOnRelease: false,
          completeOnThresholdReached: false,
          activeAreas: [
            RelativePanArea(
              area: Rect.fromLTWH(0, 0.735, 1, 0.15),
              debugArea: true,
              onAreaTapped: (){
                tapped ? tapped = false : tapped = true;
                print(tapped);
              },
            )
          ],
        ),
        //clipper: MyClipper(),
      ),
    );
  }
}

/*
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var pathCerrado = Path();
    pathCerrado.moveTo(size.width*0.8, 0.0);
    pathCerrado.lineTo(size.width*0.8, size.height);
    pathCerrado.lineTo(size.width, size.height);
    pathCerrado.lineTo(size.width, 0.0);
    pathCerrado.close();

    var pathAbierto = Path();
    pathAbierto.lineTo(0.0, size.height);
    pathAbierto.lineTo(size.width, size.height);
    pathAbierto.lineTo(size.width, 0.0);
    pathAbierto.close();

    return pathCerrado;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}*/
