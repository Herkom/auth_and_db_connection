import 'package:flutter/material.dart';

enum _Slot {
  imagen,
  mensaje,
  comments
}

class ComentarioConImagen extends StatelessWidget{
  Size screenSize;

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        maxHeight: screenSize.height*0.6
      ),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
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
                  margin: EdgeInsets.only(top:15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('http://www.osfetabasco.gob.mx/site/wp-content/themes/osfe/inc/slider/5-asech.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    height: screenSize.height/4,
                    width: screenSize.width*0.9,
                  ),
                ),
              )
          ),
          LayoutId(
              id: _Slot.comments,
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: (screenSize.height/4)*0.8 ),
                child: Card(
                  color: Colors.white,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 10.0),
                    width: screenSize.width*0.85,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 15.0),
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13.0),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage('https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large')
                                    )
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Alejandro Álvarez',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '18 de Noviembre 8:16 a.m.',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black38
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          padding: EdgeInsets.all(1.0),
                          child: Text(
                            'Extraordinaria participación de la comunidad tabasqueña en la propuesta de Ley para implementar nuestra app de transparencia en tiempo real Säc : Excelente Semana!',
                            style: TextStyle(
                              height: 1.3,
                            ),
                          )
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: Colors.grey.withAlpha(100),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5.0, left: 5.0, top: 10, bottom: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.chat, color: Colors.grey,),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container( margin: EdgeInsets.only(right: 10.0), child: Text('256')),
                                    Icon(Icons.favorite, color: Colors.grey,)
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {

  /*@override
  Size getSize(BoxConstraints constraints){
    return constraints;
  }*/

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