import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectorCategorias extends StatefulWidget {
  @override
  _SelectorCategoriasState createState() => _SelectorCategoriasState();
}

class _SelectorCategoriasState extends State<SelectorCategorias> {
  int indiceSeleccionado = 0;
  final List<String> categorias = ['Mensajes directos','Avisos','Grupos',];

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indiceSeleccionado = 0;
    setState(() {
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                indiceSeleccionado = index;
                if (index == 1){
                  Navigator.pushNamed(context, '/chat');
                  indiceSeleccionado = 0;
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    categorias[index],
                    style: TextStyle(
                      color: index == indiceSeleccionado ? Colors.white : Colors.white60,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: index == indiceSeleccionado ? 3.0 : 0.0,
                    width: index == indiceSeleccionado ? 90 : 0.0,
                    color: index == indiceSeleccionado ? Colors.white60 : Colors.transparent,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
