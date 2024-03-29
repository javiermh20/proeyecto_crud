import 'package:flutter/material.dart';
import 'package:proyecto_crud/firebase/services/sales_services.dart';
import '../widgets_genericos.dart';

// ignore: must_be_immutable
class RegisterSaleScreen extends StatelessWidget {
  RegisterSaleScreen({Key? key}) : super(key: key);
  TextEditingController _idController = TextEditingController(text: "");
  TextEditingController _idProductoController = TextEditingController(text: "");
  TextEditingController _nombreController = TextEditingController(text: "");
  TextEditingController _cantidadControler = TextEditingController(text: "");
  TextEditingController _idClienteController = TextEditingController(text: "");
  TextEditingController _piezasController = TextEditingController(text: "");
  TextEditingController _totalController = TextEditingController(text: "");

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
                      "ID Venta", Icons.money, false, TextInputType.text,
                      controller: _idController),
                  SizedBox(height: 20.0),
                  textFormField(
                      "ID Producto", Icons.add_box, false, TextInputType.text,
                      controller: _idProductoController),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Nombre", Icons.add_box, false, TextInputType.text,
                      controller: _nombreController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Cantidad", Icons.format_list_numbered,
                      false, TextInputType.number,
                      controller: _cantidadControler),
                  SizedBox(height: 20.0),
                  textFormField(
                      "ID Cliente", Icons.person, false, TextInputType.text,
                      controller: _idClienteController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Piezas", Icons.format_list_numbered,
                      false, TextInputType.number,
                      controller: _piezasController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber(
                      "Total", Icons.attach_money, false, TextInputType.number,
                      controller: _totalController),
                  SizedBox(height: 30.0),
                  elevatedButtonGuardar(context, _formKey, agregarVenta),
                  textButtonCancelar(context),
                  SizedBox(height: 90.0),
                ],
              ),
            ),
          ),
        ));
  }

  void agregarVenta() {
    addSales(
        _idController.text,
        _idProductoController.text,
        _nombreController.text,
        _cantidadControler.text,
        _idClienteController.text,
        _piezasController.text,
        _totalController.text);
  }
}
