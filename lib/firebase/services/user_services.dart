import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Obtener usuarios
Future<List> getUsers() async {
  List Users = [];
  CollectionReference users = db.collection('users');
  QuerySnapshot queryUsers = await users.get();

  queryUsers.docs.forEach((document) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final user = {
      'UsuarioId': data['UsuarioId'],
      'Nombre': data['Nombre'],
      'Apellido': data['Apellido'],
      'Imagen': data['Imagen'],
      'Edad': data['Edad'],
      'Genero': data['Genero'],
      'Correo': data['Correo'],
      'Password': data['Password'],
      'uid': document.id,
    };

    Users.add(user);
  });

  return Users;
}

//Agregar usuarios
Future<void> addUsers(
    String usuarioId,
    String nombre,
    String apellido,
    String imagen,
    String edad,
    String genero,
    String correo,
    String contrasena) async {
  await db.collection('users').add({
    'UsuarioId': usuarioId,
    'Nombre': nombre,
    'Apellido': apellido,
    'Imagen': imagen,
    'Edad': edad,
    'Genero': genero,
    'Correo': correo,
    'Password': contrasena,
  });
}

//Actualizar usuarios
Future<void> updateUsers(
    String uid,
    String newUsuarioId,
    String newNombre,
    String newApellido,
    String newImagen,
    String newEdad,
    String newGenero,
    String newCorreo,
    String newContrasena) async {
  await db.collection('users').doc(uid).set({
    'UsuarioId': newUsuarioId,
    'Nombre': newNombre,
    'Apellido': newApellido,
    'Imagen': newImagen,
    'Edad': newEdad,
    'Genero': newGenero,
    'Correo': newCorreo,
    'Password': newContrasena,
  });
}

//Eliminar usuarios
Future<void> deleteUsers(String uid) async {
  await db.collection('users').doc(uid).delete();
}
