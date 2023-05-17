import 'package:flutter/material.dart';
import '../../firebase/services/sales_services.dart';
import '../widgets_genericos.dart';

// ignore: must_be_immutable
class EditSaleScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController(text: "");
  TextEditingController _idProductoController = TextEditingController(text: "");
  TextEditingController _nombreController = TextEditingController(text: "");
  TextEditingController _cantidadController = TextEditingController(text: "");
  TextEditingController _idClienteController = TextEditingController(text: "");
  TextEditingController _piezasController = TextEditingController(text: "");
  TextEditingController _totalController = TextEditingController(text: "");

  EditSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _idController.text = arguments['id'];
    _idProductoController.text = arguments['productoId'];
    _nombreController.text = arguments['nombre'];
    _cantidadController.text = arguments['cantidad'];
    _idClienteController.text = arguments['clienteId'];
    _piezasController.text = arguments['piezas'];
    _totalController.text = arguments['total'];

    void modificarVenta() {
      updateSales(
          arguments['uid'],
          _idController.text,
          _idProductoController.text,
          _nombreController.text,
          _cantidadController.text,
          _idClienteController.text,
          _piezasController.text,
          _totalController.text);
    }

    void eliminarVenta() {
      deleteSales(arguments['uid']);
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
                  textFormField(
                      "ID Venta", Icons.add_box, false, TextInputType.text,
                      controller: _idController),
                  SizedBox(height: 20.0),
                  textFormField(
                      "ID Product", Icons.add_box, false, TextInputType.text,
                      controller: _idProductoController),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Nombre", Icons.person, false, TextInputType.text,
                      controller: _nombreController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Cantidad", Icons.format_list_numbered,
                      false, TextInputType.number,
                      controller: _cantidadController),
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
                  elevatedButtonGuardar(context, _formKey, modificarVenta),
                  elevatedButtonEliminar(context, arguments['uid'],
                      arguments['nombre'], eliminarVenta),
                  textButtonCancelar(context),
                  SizedBox(height: 90.0),
                ],
              ),
            ),
          ),
        ));
  }
}
