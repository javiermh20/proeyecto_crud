import 'package:flutter/material.dart';
import 'package:proyecto_crud/firebase/services/product_services.dart';
import '../widgets_genericos.dart';

// ignore: must_be_immutable
class EditProductScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController(text: "");
  TextEditingController _nombreController = TextEditingController(text: "");
  TextEditingController _descripcionController =
      TextEditingController(text: "");
  TextEditingController _imagenController = TextEditingController(text: "");
  TextEditingController _unidadesController = TextEditingController(text: "");
  TextEditingController _costoInversionController =
      TextEditingController(text: "");
  TextEditingController _precioVentaController =
      TextEditingController(text: "");
  TextEditingController _utilidadController = TextEditingController(text: "");

  EditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _idController.text = arguments['id'];
    _nombreController.text = arguments['nombre'];
    _descripcionController.text = arguments['descripcion'];
    _imagenController.text = arguments['imagen'];
    _unidadesController.text = arguments['unidades'];
    _costoInversionController.text = arguments['costoInversion'];
    _precioVentaController.text = arguments['precioVenta'];
    _utilidadController.text = arguments['utilidad'];

    void modificarProducto() {
      updateProducts(
          arguments['uid'],
          _idController.text,
          _nombreController.text,
          _descripcionController.text,
          _imagenController.text,
          _unidadesController.text,
          _costoInversionController.text,
          _precioVentaController.text,
          _utilidadController.text);
    }

    void eliminarProducto() {
      deleteProducts(arguments['uid']);
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
                  textFormField("Descripcion", Icons.description, false,
                      TextInputType.text,
                      controller: _descripcionController),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Imagen", Icons.image, false, TextInputType.text,
                      controller: _imagenController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Unidades", Icons.format_list_numbered,
                      false, TextInputType.number,
                      controller: _unidadesController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Costo de inversion", Icons.attach_money,
                      false, TextInputType.number,
                      controller: _costoInversionController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Precio de venta", Icons.attach_money,
                      false, TextInputType.number,
                      controller: _precioVentaController),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Utilidad", Icons.attach_money, false,
                      TextInputType.number,
                      controller: _utilidadController),
                  SizedBox(height: 30.0),
                  elevatedButtonGuardar(context, _formKey, modificarProducto),
                  elevatedButtonEliminar(context, arguments['uid'],
                      arguments['nombre'], eliminarProducto),
                  textButtonCancelar(context),
                  SizedBox(height: 90.0),
                ],
              ),
            ),
          ),
        ));
  }
}
