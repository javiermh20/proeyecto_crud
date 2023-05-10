import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/register_screens/product_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

class RegisterSaleScreen extends StatelessWidget {
  RegisterSaleScreen({Key? key}) : super(key: key);

  final id_Producto_Controller = TextEditingController();
  final nombre_Controller = TextEditingController();
  final cantidad_Controller = TextEditingController();
  final id_Cliente_Controller = TextEditingController();
  final piezas_Controller = TextEditingController();
  final subtotal_Controller = TextEditingController();
  final total_Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                textFormField("ID Producto", Icons.add_box, false,
                    TextInputType.text, id_Producto_Controller),
                SizedBox(height: 20.0),
                textFormField("Nombre", Icons.edit, false, TextInputType.text,
                    nombre_Controller),
                SizedBox(height: 20.0),
                textFormFieldNumber("Cantidad", Icons.format_list_numbered,
                    false, TextInputType.number, cantidad_Controller),
                SizedBox(height: 20.0),
                textFormField("ID Cliente", Icons.money_rounded, false,
                    TextInputType.text, id_Cliente_Controller),
                SizedBox(height: 20.0),
                textFormFieldNumber("Piezas", Icons.format_list_numbered, false,
                    TextInputType.number, piezas_Controller),
                SizedBox(height: 20.0),
                textFormFieldNumber("Subtotal", Icons.attach_money, false,
                    TextInputType.number, subtotal_Controller),
                SizedBox(height: 20.0),
                textFormFieldNumber("Total", Icons.attach_money, false,
                    TextInputType.number, total_Controller),
                SizedBox(height: 30.0),
                elevatedButtonGuardar(context, _formKey, () {
                  //*Funcion para subir datos
                }),
                textButtonCancelar(context),
                SizedBox(height: 90.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
