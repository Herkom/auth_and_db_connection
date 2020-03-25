import 'dart:io';

import 'package:auth_and_db_connection/User/model/user.dart';

class MensajeFiscal {
  int id;
  String nombre;
  String fotoPerfil;
  String date;
  String contenido;
  String imagenPath;
  // Quitar esto cuando ya este la nube
  File imagen;
  bool extendido;
  int likes;

  MensajeFiscal({ this.fotoPerfil, this.contenido, this.nombre, this.date, this.likes, this.imagenPath, this.imagen, this.extendido });
}

//Usuario Actual
Usuario usuarioActual = Usuario(
    claveInterna: 0,
    nombre: 'Alejandro Álvarez',
    foto:'https://pbs.twimg.com/media/D6EWSjvUEAAOBpO.jpg:large',
    status: 1,
    unidadAdministrativa: 'Fiscal Superior'
);

//Usuarios
Usuario omar = Usuario(
  claveInterna: 168,
  nombre: 'Omar Guadarrama',
  foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000252.jpg',
  status: 1,
  unidadAdministrativa: 'Departamento de Desarrollo de Sistemas y Multimedia'
);

Usuario marco = Usuario(
    claveInterna: 2553,
    nombre: 'Marco Collazo',
    foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000504.jpg',
    status: 1,
    unidadAdministrativa: 'Departamento de Desarrollo de Sistemas y Multimedia'
);

Usuario odilia = Usuario(
    claveInterna: 167,
    nombre: 'Odilia Landero',
    foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000197.jpg',
    status: 1,
    unidadAdministrativa: 'Dirección de Fiscalización y Evaluación Gubernamental'
);

Usuario lalo = Usuario(
    claveInterna: 2554,
    nombre: 'Cristhian Zavala',
    foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000505.jpg',
    status: 1,
    unidadAdministrativa: 'Dirección de Fiscalización y Evaluación Gubernamental'
);

Usuario clara = Usuario(
    claveInterna: 2556,
    nombre: 'Clara Zurita',
    foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000512.jpg',
    status: 1,
    unidadAdministrativa: 'Unidad Técnica del Servicio Fiscalizador de Carrera'
);

Usuario wakanda = Usuario(
    claveInterna: 2549,
    nombre: 'Christopher Lwanga',
    foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000501.jpg',
    status: 1,
    unidadAdministrativa: 'Secretaria Técnica y Transparencia'
);

Usuario bety = Usuario(
    claveInterna: 2539,
    nombre: 'Beatríz Hernández',
    foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000492.jpg',
    status: 1,
    unidadAdministrativa: 'Dirección de Contraloría Interna'
);

Usuario daniel = Usuario(
    claveInterna: 2528,
    nombre: 'Daniel González',
    foto:'http://200.56.118.28/Apps/AplicationFiles/Administracion/Rh/Fotos/00000478.jpg',
    status: 1,
    unidadAdministrativa: 'Dirección de Auditoría Técnica y Evaluación a Proyectos de Inversión Pública'
);

// Contactos favoritos
List<Usuario> favoritos = [omar, marco, odilia, lalo, clara, wakanda, bety, daniel];

class Message {
  final Usuario sender;
  final String
  time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: omar,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: marco,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: odilia,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: lalo,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: daniel,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: clara,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: wakanda,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: bety,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: clara,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: usuarioActual,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: clara,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: clara,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: usuarioActual,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: clara,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];