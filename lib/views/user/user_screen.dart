import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/register_screens/register_sales_screen.dart';
import 'package:proyecto_crud/views/user/menu_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/register_purchase_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
                Image(
                  image: AssetImage('assets/images/opciones.png'),
                  height: 180.0,
                  fit: BoxFit.cover,
                  color: Colors.white70,
                ),
                SizedBox(height: 30.0),
                Text(
                  'Opciones',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(color: Colors.white60),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.purple[700],
                    ),
                    title: Text(
                      'Registrar',
                      style: TextStyle(
                        color: Colors.purple[700],
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MenuRegisterScreen()),
                      );
                    },
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.attach_money,
                      color: Colors.purple[700],
                    ),
                    title: Text(
                      'Ventas',
                      style: TextStyle(
                        color: Colors.purple[700],
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterSaleScreen()),
                      );
                    },
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_cart,
                      color: Colors.purple[700],
                    ),
                    title: Text(
                      'Compras',
                      style: TextStyle(
                        color: Colors.purple[700],
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPurchaseScreen()),
                      );
                    },
                  ),
                ),
                TextButton(
                  child: Text(
                    'CANCELAR',
                    style: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 2.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )));
  }
}
