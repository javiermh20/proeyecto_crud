class Producto {
  String id;
  String nombre="";
  String apellido="";
  String fecha_nacimiento="";
  String sexo="";
  String email="";
  String password="";

  Producto({required this.id, required this.nombre, required this.apellido, required this.fecha_nacimiento, required this.sexo, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "apellido": apellido,
    "fecha_nacimiento": fecha_nacimiento,
    "sexo": sexo,
    "email": email,
    "password": password
  };
}