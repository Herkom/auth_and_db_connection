import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:auth_and_db_connection/User/model/user.dart';

class AuthAPI{

  String numeroEmpleado;
  String contrasena;
  List response;
  //String usuario;

  Future<Usuario> signIn(a, b) async {
    numeroEmpleado = a;
    contrasena = b;

    final jsonString = await http.get('http://200.56.118.30:4200/caosf/$numeroEmpleado');

    if (jsonString.statusCode == 200){

      final jsonResponse = json.decode(jsonString.body);

      print(jsonResponse);

      response = new UsuariosLista.fromJson(jsonResponse).usuarios;
    }
    return response.elementAt(0);
  }

  signOut() async {
    print('Sesiones cerradas');
    response = null;
  }

}