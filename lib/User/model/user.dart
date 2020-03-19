class UsuariosLista{
  final List<Usuario> usuarios;

  UsuariosLista({
    this.usuarios,
  });

  factory UsuariosLista.fromJson(List<dynamic> parsedJson){

    List<Usuario> usuarios = new List<Usuario>();
    usuarios = parsedJson.map((i)=>Usuario.fromJson(i)).toList();

    return new UsuariosLista(
      usuarios: usuarios,
    );
  }
}

class Usuario {
  final int claveInterna;
  final String nombre;
  final String foto;
  final int status;
  final String unidadAdministrativa;

  Usuario({
    this.claveInterna,
    this.nombre,
    this.foto,
    this.status,
    this.unidadAdministrativa
  });

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
      claveInterna: parsedJson['ClaveInterna'],
      nombre: parsedJson['name'],
      foto: parsedJson['Link'],
      status: parsedJson['active'],
      unidadAdministrativa: parsedJson['ua'],
    );
  }
}