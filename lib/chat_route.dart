import 'package:flutter/material.dart';

import 'gradient_back.dart';

class ChatRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatRoute();
  }
}

enum _Slot {
  imagen,
  mensaje,
  comments
}

class _ChatRoute extends State<ChatRoute>{
  Size screenSize;
  @override

  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Mensajes'),
        ),
        body:Stack(
          children: <Widget>[
            GradientBack( screenSize.height ),
            ListView(
              children: <Widget>[

                /* Card(
                    color: Colors.white,
                    elevation: 10.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('http://www.osfetabasco.gob.mx/site/wp-content/themes/osfe/inc/slider/5-asech.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: screenSize.height/4,
                      width: screenSize.width*0.85,
                    ),
                  ),
                  Card(
                    color: Colors.blueGrey,
                    elevation: 10.0,
                    margin: EdgeInsets.all(10.0),
                    child: Container(
                      height: screenSize.height/3,
                      width: screenSize.width*0.8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

                  Positioned(
                    top: 130.0,
                    height: screenSize.height/3,
                    child: Card(
                      color: Colors.white,
                      elevation: 10.0,
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                        height: screenSize.height,
                        width: screenSize.width*0.78,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),*/
                Container(
                  height: screenSize.height*0.7,
                  color: Colors.deepOrange.withAlpha(100),
                  child: CustomMultiChildLayout(
                    delegate: MyDelegate(),
                    children: <Widget>[
                      LayoutId(
                          id: _Slot.imagen,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Card(
                              color: Colors.white,
                              elevation: 10.0,
                              margin: EdgeInsets.only(top:20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('http://www.osfetabasco.gob.mx/site/wp-content/themes/osfe/inc/slider/5-asech.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                height: screenSize.height/4,
                                width: screenSize.width*0.9,
                              ),
                            ),
                          )
                      ),
                      /*LayoutId(
                          id: _Slot.mensaje,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top:40.0),
                              child: Card(
                                color: Colors.blueGrey.withAlpha(100),
                                elevation: 10.0,
                                margin: EdgeInsets.all(10.0),
                                child: Container(
                                  height: screenSize.height/3,
                                  width: screenSize.width*0.8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                      ),*/
                      LayoutId(
                          id: _Slot.comments,
                          child: Container(
                            //alignment: Alignment.bottomCenter,
                            child: Card(
                              color: Colors.white,
                              elevation: 5.0,
                              //margin: EdgeInsets.only(top:10.0),
                              child: Container(
                                height: 150.0,
                                width: screenSize.width*0.85,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),

          ],
        )
    )
    ;
  }
}




class MyDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {

    if(hasChild( _Slot.imagen )){
      layoutChild( _Slot.imagen, BoxConstraints.loose(size) );
      positionChild( _Slot.imagen, Offset.zero );
    }

    if(hasChild(_Slot.mensaje)){
      layoutChild(_Slot.mensaje, BoxConstraints.loose(size) );
      positionChild(_Slot.mensaje, Offset.zero );
    }

    if(hasChild(_Slot.comments)){
      layoutChild(_Slot.comments, BoxConstraints.loose(size) );
      positionChild(_Slot.comments, Offset.zero );
    }

    /*if (hasChild(_Slot.leader)) {
      leaderSize = layoutChild(_Slot.leader, BoxConstraints.loose(size));
      positionChild(_Slot.leader, Offset.zero);
    }

    if (hasChild(_Slot.follower)) {
      layoutChild(_Slot.follower, BoxConstraints.tight(leaderSize));
      positionChild(_Slot.follower, Offset(size.width - leaderSize.width,
          size.height - leaderSize.height));
    }*/
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}