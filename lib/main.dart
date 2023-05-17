import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/edit_screen/product_edit_screen.dart';
import 'package:proyecto_crud/views/edit_screen/purchase_edit_screen.dart';
import 'package:proyecto_crud/views/edit_screen/sale_edit_screen.dart';
import 'package:proyecto_crud/views/edit_screen/user_edit_screen.dart';
import 'package:proyecto_crud/views/list_screen/product_list_screen.dart';
import 'package:proyecto_crud/views/list_screen/purchase_list_screen.dart';
import 'package:proyecto_crud/views/list_screen/sale_list_screen.dart';
import 'package:proyecto_crud/views/list_screen/user_list_screen.dart';
import 'package:proyecto_crud/views/login_screen.dart';
import 'package:proyecto_crud/views/register_screens/product_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/purchase_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/sales_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';
import 'package:proyecto_crud/views/user/menu_register_screen.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/userScreen': (context) => UserScreen(),
        '/menuScreen': (context) => MenuRegisterScreen(),
        '/listProducts': (context) => ListProductsScreen(),
        '/addProduct': (context) => RegisterProductScreen(),
        '/editProduct': (context) => EditProductScreen(),
        '/listUsers': (context) => ListUsersScreen(),
        '/addUser': (context) => RegisterUserScreen(),
        '/editUser': (context) => EditUserScreen(
            arguments: ModalRoute.of(context)!.settings.arguments
                as Map<dynamic, dynamic>),
        '/listSales': (context) => ListSalesScreen(),
        '/addSale': (context) => RegisterSaleScreen(),
        '/editSale': (context) => EditSaleScreen(),
        '/listPurchase': (context) => ListPurchaseScreen(),
        '/addPurchase': (context) => RegisterPurchaseScreen(),
        '/editPurchase': (context) => EditPurchaseScreen(),
      },
    );
  }
}
