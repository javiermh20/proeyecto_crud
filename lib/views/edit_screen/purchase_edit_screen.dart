import 'package:flutter/material.dart';
import 'package:proyecto_crud/firebase/services/purchase_services.dart';
import '../widgets_genericos.dart';

// ignore: must_be_immutable
class EditPurchaseScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController(text: "");
  TextEditingController _nombreController = TextEditingController(text: "");
  TextEditingController _precioController = TextEditingController(text: "");
  TextEditingController _idAdministradorController =
      TextEditingController(text: "");

  EditPurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _idController.text = arguments['id'];
    _nombreController.text = arguments['nombre'];
    _precioController.text = arguments['precio'];
    _idAdministradorController.text = arguments['administradorId'];

    void modificarCompra() {
      updatePurchases(
          arguments['uid'],
          _idController.text,
          _nombreController.text,
          _precioController.text,
          _idAdministradorController.text);
    }

    void eliminarCompra() {
      deletePurchases(arguments['uid']);
    }

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
                  textFormField("ID", Icons.add_box, false, TextInputType.text,
                      controller: _idController),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Nombre", Icons.person, false, TextInputType.text,
                      controller: _nombreController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber(
                      "Precio", Icons.money, false, TextInputType.number,
                      controller: _precioController),
                  SizedBox(height: 20.0),
                  textFormField("ID Administrador", Icons.fingerprint, false,
                      TextInputType.text,
                      controller: _idAdministradorController),
                  SizedBox(height: 30.0),
                  elevatedButtonGuardar(context, _formKey, modificarCompra),
                  elevatedButtonEliminar(context, arguments['uid'],
                      arguments['nombre'], eliminarCompra),
                  textButtonCancelar(context),
                  SizedBox(height: 800.0),
                ],
              ),
            ),
          ),
        ));
  }
}
