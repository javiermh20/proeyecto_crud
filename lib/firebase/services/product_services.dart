import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Obtener productos
Future<List> getProducts() async {
  List Products = [];
  CollectionReference products = db.collection('products');
  QuerySnapshot queryProducts = await products.get();

  queryProducts.docs.forEach((document) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final product = {
      'ProductoId': data['ProductoId'],
      'Nombre': data['Nombre'],
      'Descripcion': data['Descripcion'],
      'Imagen': data['Imagen'],
      'Unidades': data['Unidades'],
      'Inversion': data['Inversion'],
      'PVenta': data['PVenta'],
      'Utilidad': data['Utilidad'],
      'uid': document.id,
    };
    Products.add(product);
  });

  return Products;
}

//Agregar productos
Future<void> addProducts(
    String id,
    String nombre,
    String descripcion,
    String imagen,
    String unidades,
    String costoInversion,
    String precioVenta,
    String utilidad) async {
  await db.collection('products').add({
    'ProductoId': id,
    'Nombre': nombre,
    'Descripcion': descripcion,
    'Imagen': imagen,
    'Unidades': unidades,
    'Inversion': costoInversion,
    'PVenta': precioVenta,
    'Utilidad': utilidad
  });
}

//Actualizar productos
Future<void> updateProducts(
    String uid,
    String newId,
    String newNombre,
    String newDescripcion,
    String newImagen,
    String newUnidades,
    String newCostoInversion,
    String newPrecioVenta,
    String newUtilidad) async {
  await db.collection('products').doc(uid).set({
    'ProductoId': newId,
    'Nombre': newNombre,
    'Descripcion': newDescripcion,
    'Imagen': newImagen,
    'Unidades': newUnidades,
    'Inversion': newCostoInversion,
    'PVenta': newPrecioVenta,
    'Utilidad': newUtilidad
  });
}

//Eliminar productos
Future<void> deleteProducts(String uid) async {
  await db.collection('products').doc(uid).delete();
}
