import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/list_screen/product_list_screen.dart';
import 'package:proyecto_crud/views/register_screens/product_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

class MenuRegisterScreen extends StatelessWidget {
  const MenuRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.purple[900]!,
                  Colors.purple[700]!,
                  Colors.purple[500]!,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                imageRegistrar(),
                SizedBox(height: 30),
                textRegistrar(),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(color: Colors.white60),
                ),
                cardUsuario(context),
                cardProducto(context),
                textButtonCancelar(context),
              ],
            )));
  }
}

Widget imageRegistrar() {
  return Image(
    image: AssetImage('assets/images/registrar.png'),
    height: 180.0,
    fit: BoxFit.cover,
    color: Colors.white70,
  );
}

Widget textRegistrar() {
  return Text(
    'Registrar',
    style: TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 40.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget cardUsuario(context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.purple[700],
      ),
      title: Text(
        'Usuario',
        style: TextStyle(
          color: Colors.purple[700],
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterUserScreen()),
        );
      },
    ),
  );
}

Widget cardProducto(context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        Icons.add_box_rounded,
        color: Colors.purple[700],
      ),
      title: Text(
        'Producto',
        style: TextStyle(
          color: Colors.purple[700],
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListProductsScreen()),
        );
      },
    ),
  );
}
