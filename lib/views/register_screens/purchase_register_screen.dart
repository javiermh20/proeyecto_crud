import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/register_screens/product_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

import '../widgets/textFieldWidget.dart';

class RegisterPurchaseScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterPurchaseScreen({Key? key}) : super(key: key);

  TextEditingController id_Controller = TextEditingController();
  TextEditingController nombre_Controller = TextEditingController();
  TextEditingController precio_Controller = TextEditingController();
  TextEditingController ida_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20.0),
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
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 150),
                textFormField("ID", Icons.person, false, TextInputType.text, id_Controller),
                SizedBox(height: 20),
                textFormField(
                    "Nombre", Icons.person, false, TextInputType.text, nombre_Controller),
                SizedBox(height: 20),
                textFormFieldNumber(
                   hintText: "Precio", icon: Icons.attach_money, obscureText: false, textInputType: TextInputType.number, controller: precio_Controller),
                SizedBox(height: 20),
                textFormField(
                    "IDA", Icons.fingerprint, false, TextInputType.text, ida_Controller),
                SizedBox(height: 30.0),
                elevatedButtonGuardar(context, _formKey, (){
                  //*Aqui iria la funcion para subir un nuevo objeto.
                }),
                textButtonCancelar(context),
                SizedBox(height: 250.0),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
