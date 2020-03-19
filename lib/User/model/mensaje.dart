import 'dart:io';

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