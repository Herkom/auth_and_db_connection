import 'dart:io';

import 'package:auth_and_db_connection/User/model/mensaje.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:auth_and_db_connection/comentario_Fiscal.dart';
import 'package:auth_and_db_connection/comentario_Fiscal_conImagen.dart';
import 'package:flutter/rendering.dart';
//import 'package:auth_and_db_connection/comentario_simple.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
//import 'custom_layout.dart';
import 'gradient_back.dart';
//import 'menu_pegajoso.dart';

import 'package:image_picker/image_picker.dart';

class ChatRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatRoute();
  }
}

class _ChatRoute extends State<ChatRoute>{
  Size screenSize;
  File imagen;
  double anchoDeImagen = 0;
  double altoDeImagen = 0;
  double imageContainerHeight = 0.0;
  TextEditingController textController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  initState(){
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 150,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 2000),
      );
    });
    setState(() {
    });
  }

  List<MensajeFiscal> mensajes =  [
    MensajeFiscal(
      fotoPerfil: 'https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large',
      imagenPath: 'http://www.osfetabasco.gob.mx/site/wp-content/themes/osfe/inc/slider/1-protesta.jpg',
      nombre: 'Alejandro Álvarez',
      date: '18 de noviembre de 2019, 8:16 a.m.',
      contenido: 'Extraordinaria participación de la comunidad tabasqueña en la propuesta de Ley para implementar nuestra app de transparencia en tiempo real Säc : Excelente Semana!',
      likes: 256,
      extendido: true,
    ),
    MensajeFiscal(
      fotoPerfil: 'https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large',
      imagenPath: null,
      nombre: 'Alejandro Álvarez',
      date: '18 de noviembre de 2019, 9:31 a.m.',
      contenido: 'Excelente respuesta del público, interacción, muchas preguntas.',
      likes: 101,
      extendido: false,
    ),
    MensajeFiscal(
      fotoPerfil: 'https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large',
      imagenPath: 'https://instagram.fmtt1-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s750x750/82234773_605621290216016_4447359471249667814_n.jpg?_nc_ht=instagram.fmtt1-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=jCqjLL_igxYAX8tH8vQ&oh=c2018bcc612bdd9c16c2d718b8e7a2a9&oe=5E912500',
      nombre: 'Alejandro Álvarez',
      date: '16 de enero de 2019, 8:16 a.m.',
      contenido: 'Recibí a personal de la Secretaría de la Función Pública del Estado para compartirles nuestra experiencia en la sistematización de nuestras auditorías,',
      likes: 14,
      extendido: true,
    ),
    MensajeFiscal(
      fotoPerfil: 'https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large',
      imagenPath: null,
      nombre: 'Alejandro Álvarez',
      date: '2 de marzo de 2020, 10:00 a.m.',
      contenido: 'Favor de pasar a la Sala de Juntas.',
      likes: 24,
      extendido: false,
    ),
  ];

  /*publicaComentario(){
    mensajes.add(MensajeFiscal(
      fotoPerfil: 'https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large',
      imagen: null,
      nombre: 'Alejandro Álvarez',
      date: DatePickerDateOrder.dmy.toString(),
      contenido: textController.value.text,
      likes: 999,
      extendido: false,
    ));
    textController.clear();
    setState(() {
    });
  }*/

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    //_scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    // TODO: implement build
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack(),
            ListView.builder(
              //dragStartBehavior: DragStartBehavior.down,
              controller: _scrollController,
              //reverse: true,
              //shrinkWrap: true,
              itemCount: mensajes.length,
              padding: EdgeInsetsDirectional.only(bottom: 70, top: 30),
              itemBuilder: (context, index) {
                if(mensajes[index].extendido){
                  return ComentarioConImagen(fotoPerfil: mensajes[index].fotoPerfil, contenido:mensajes[index].contenido, nombre:mensajes[index].nombre, date:mensajes[index].date, likes:mensajes[index].likes, imagenPath: mensajes[index].imagenPath, imagen: mensajes[index].imagen);
                }
                else{
                  return ComentarioFiscal(fotoPerfil: mensajes[index].fotoPerfil, contenido:mensajes[index].contenido, nombre:mensajes[index].nombre, date:mensajes[index].date, likes:mensajes[index].likes);
                }
              }
            ),
            Positioned(
              bottom: 6,
              child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: screenSize.width * 0.82,
                        margin: EdgeInsets.only(right: screenSize.width * 0.02),
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                /*image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(url),
                                ),*/
                              ),
                              height: imageContainerHeight,
                              width: screenSize.width * 0.82,
                              child: imagen == null
                              ? Container()
                              : Stack(
                                children: <Widget>[
                                  Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal:10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Favor de'),
                                            Text('tomar la'),
                                            Text('fotografía'),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal:10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text('en formato'),
                                            Text('horizontal'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                  Container(
                                    width: screenSize.width * 0.82,
                                    child: Image.file(imagen, fit:BoxFit.fitWidth),
                                  )
                                ],
                                alignment: Alignment.center,
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.all(0),
                                  width: screenSize.width * 0.685,
                                  //color: Colors.greenAccent,
                                  child: TextFormField(
                                    controller: textController,
                                    maxLength: 600,
                                    minLines: 1,
                                    maxLines: 15,
                                    cursorColor: Colors.grey,
                                    decoration: InputDecoration(
                                      counterStyle: TextStyle(
                                          height: -15
                                      ),
                                      //counter: Text('mjinhubgytfr'),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(30.0),
                                        ),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      counterText: '',
                                      contentPadding: EdgeInsetsDirectional.only(start: 15, bottom: 10, top: 10, end:0),
                                      //alignLabelWithHint: true,
                                      //icon: Icon(Icons.message),
                                      //prefixIcon: Icon(Icons.message),
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      //hintText: 'Mensaje',
                                      //helperText: 'Máximo 600 caracteres',
                                      hasFloatingPlaceholder:false,
                                      labelText: 'Escriba un mensaje',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.all(0),
                                  //width: screenSize.width * 0.1,
                                  //color: Colors.green,
                                  child: Transform(
                                    transform: Matrix4.rotationZ(2.5),
                                    alignment: FractionalOffset.center,
                                    child: IconButton(
                                      icon: Icon(Icons.attachment),
                                      padding: EdgeInsets.all(0),
                                      color: Colors.grey,
                                      onPressed: ()async {
                                          print('----------------Imprimimos algo----------------');
                                          await ImagePicker.pickImage(source: ImageSource.camera)
                                              .then((image){
                                                setState((){
                                                  imagen = image;
                                                  imageContainerHeight = screenSize.height * 0.25;
                                                });
                                            print('----------------${image.hashCode}----------------');
                                          }).catchError((onError)=> print(onError));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.indigoAccent,
                          shape: CircleBorder(),
                        ),
                        //padding: EdgeInsets.only(left: 5),
                        //margin: EdgeInsets.all(0),
                        //width: screenSize.width * 0.1,
                        child: IconButton(
                          icon: Icon(Icons.send),
                          splashColor: Colors.indigoAccent,
                          iconSize: 22,
                          padding: EdgeInsets.all(0),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              mensajes.add(
                                  MensajeFiscal(
                                    fotoPerfil: 'https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large',
                                    imagen: imagen,
                                    imagenPath: imagen == null ? null : imagen.path,
                                    nombre: 'Alejandro Álvarez',
                                    date: DateTime.now().toString(),
                                    contenido: textController.value.text,
                                    likes: 999,
                                    extendido: imagen == null ? false : true ,
                                  )
                              );
                            });
                            SchedulerBinding.instance.addPostFrameCallback(
                              (_) {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent + 150,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 1000),
                                );
                              }
                            );
                            imagen = null;
                            imageContainerHeight = 0.0;
                            textController.clear();
                          },
                        ),
                      ),
                    ],
                  ),
            ),
          ],
        )
    );
  }
}