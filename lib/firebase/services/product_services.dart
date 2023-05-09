import 'package:cloud_firestore/cloud_firestore.dart';

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
