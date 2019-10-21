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
