import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Obtener compras
Future<List> getPurchases() async {
  List Purchases = [];
  CollectionReference purchases = db.collection('purchases');
  QuerySnapshot queryPurchases = await purchases.get();

  queryPurchases.docs.forEach((document) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final purchase = {
      'CompraId': data['CompraId'],
      'Nombre': data['Nombre'],
      'Precio': data['Precio'],
      'AdministradorId': data['AdministradorId'],
      'uid': document.id,
    };

    Purchases.add(purchase);
  });

  return Purchases;
}

//Agregar compras
Future<void> addPurchases(String compraId, String nombre, String precio,
    String administradorId) async {
  await db.collection('purchases').add({
    "CompraId": compraId,
    "Nombre": nombre,
    "Precio": precio,
    "AdministradorId": administradorId,
  });
}

//Actualizar compras
Future<void> updatePurchases(String uid, String newCompraId, String newNombre,
    String newPrecio, String newAdministradorId) async {
  await db.collection('purchases').doc(uid).set({
    "CompraId": newCompraId,
    "Nombre": newNombre,
    "Precio": newPrecio,
    "AdministradorId": newAdministradorId,
  });
}

//Eliminar compras
Future<void> deletePurchases(String uid) async {
  await db.collection('purchases').doc(uid).delete();
}
