import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/register_screens/product_register_screen.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

class RegisterSaleScreen extends StatelessWidget {
  RegisterSaleScreen({Key? key}) : super(key: key);

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
                  textFormField(
                      "ID Producto", Icons.add_box, false, TextInputType.text),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Nombre", Icons.edit, false, TextInputType.text),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Cantidad", Icons.format_list_numbered,
                      false, TextInputType.number),
                  SizedBox(height: 20.0),
                  textFormField("ID Cliente", Icons.money_rounded, false,
                      TextInputType.text),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Piezas", Icons.format_list_numbered,
                      false, TextInputType.number),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Subtotal", Icons.attach_money, false,
                      TextInputType.number),
                  SizedBox(height: 20.0),
                  textFormFieldNumber(
                      "Total", Icons.attach_money, false, TextInputType.number),
                  SizedBox(height: 30.0),
                  elevatedButtonGuardar(context, _formKey),
                  textButtonCancelar(context),
                  SizedBox(height: 90.0),
                ],
              ),
            ),
          ),
        ));
  }
}
