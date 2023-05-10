import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_crud/firebase/models/product_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProducts() async {
  List Products = [];
  CollectionReference products = db.collection('products');
  QuerySnapshot queryProducts = await products.get();

  queryProducts.docs.forEach((document) {
    Products.add(document.data());
  });

  return Products;
}


/*Map<String, dynamic> data = {
  "id": "1",
  "nombre": "Jua",
  "apellido": "skldfj",
  "fecha_de_nacimiento": "12sd1f50",
  "sexo": "masculino",
  "email": "asd@gmskdjf.com",
  "pasword": "skdfjk"
};*/

/*Bool insertarDatos(){
  CollectionReference productos = db.collection("products");
  productos.add(data);
  
}*/

Future<DocumentReference<Map<String, dynamic>>>? agregarProducto(Producto producto){
  try{
    Future<DocumentReference<Map<String, dynamic>>> firebaseID = FirebaseFirestore.instance.collection("products").add(producto.toJson());
    return firebaseID;
  }catch (err) {
    print("Error al agregar persona $err");
    return null;
  }
}