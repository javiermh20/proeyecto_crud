import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Obtener ventas
Future<List> getSales() async {
  List Sales = [];
  CollectionReference sales = db.collection('sales');
  QuerySnapshot querySales = await sales.get();

  querySales.docs.forEach((document) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final sale = {
      'VentaId': data['VentaId'],
      'ProductoId': data['ProductoId'],
      'Nombre': data['Nombre'],
      'Cantidad': data['Cantidad'],
      'ClienteId': data['ClienteId'],
      'Piezas': data['Piezas'],
      'Total': data['Total'],
      'uid': document.id,
    };

    Sales.add(sale);
  });

  return Sales;
}

//Agregar ventas
Future<void> addSales(String ventaId, String productoId, String nombre,
    String cantidad, String clienteId, String piezas, String total) async {
  await db.collection('sales').add({
    'VentaId': ventaId,
    'ProductoId': productoId,
    'Nombre': nombre,
    'Cantida': cantidad,
    'ClienteId': clienteId,
    'Piezas': piezas,
    'Total': total,
  });
}

//Actualizar ventas
Future<void> updateSales(
    String uid,
    String newVentaId,
    String newProductoId,
    String newNombre,
    String newCantidad,
    String newClienteId,
    String newPiezas,
    String newTotal) async {
  await db.collection('sales').doc(uid).set({
    'VentaId': newVentaId,
    'ProductoId': newProductoId,
    'Nombre': newNombre,
    'Cantidad': newCantidad,
    'ClienteId': newClienteId,
    'Piezas': newPiezas,
    'Total': newTotal,
  });
}

//Eliminar ventas
Future<void> deleteSales(String uid) async {
  await db.collection('sales').doc(uid).delete();
}
