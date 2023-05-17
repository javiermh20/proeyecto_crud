import 'package:flutter/material.dart';
import 'package:proyecto_crud/firebase/services/purchase_services.dart';
import 'package:proyecto_crud/views/widgets_genericos.dart';

// ignore: must_be_immutable
class RegisterPurchaseScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _idController = TextEditingController(text: "");
  TextEditingController _nombreController = TextEditingController(text: "");
  TextEditingController _precioController = TextEditingController(text: "");
  TextEditingController _idAdministradorController =
      TextEditingController(text: "");
  RegisterPurchaseScreen({Key? key}) : super(key: key);

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
                textFormField("ID", Icons.person, false, TextInputType.text,
                    controller: _idController),
                SizedBox(height: 20),
                textFormField("Nombre", Icons.person, false, TextInputType.text,
                    controller: _nombreController),
                SizedBox(height: 20),
                textFormFieldNumber(
                    "Precio", Icons.attach_money, false, TextInputType.number,
                    controller: _precioController),
                SizedBox(height: 20),
                textFormField(
                    "IDA", Icons.fingerprint, false, TextInputType.text,
                    controller: _idAdministradorController),
                SizedBox(height: 30.0),
                elevatedButtonGuardar(context, _formKey, agregarCompra),
                textButtonCancelar(context),
                SizedBox(height: 250.0),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void agregarCompra() {
    addPurchases(_idController.text, _nombreController.text,
        _precioController.text, _idAdministradorController.text);
  }
}
