import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

class RegisterProductScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterProductScreen({Key? key}) : super(key: key);

  TextEditingController id_Controller = TextEditingController();
  TextEditingController nombre_Controller = TextEditingController();
  TextEditingController descripcion_Controller = TextEditingController();
  TextEditingController unidades_Controller = TextEditingController();
  TextEditingController costo_Controller = TextEditingController();
  TextEditingController precio_Controller = TextEditingController();
  TextEditingController utilidad_Controller = TextEditingController();

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
                  textFormField("ID", Icons.add_box, false, TextInputType.text, id_Controller),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Nombre", Icons.person, false, TextInputType.text, nombre_Controller),
                  SizedBox(height: 20.0),
                  textFormField("Descripcion", Icons.description, false,
                      TextInputType.text, descripcion_Controller),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Unidades", Icons.format_list_numbered,
                      false, TextInputType.number, unidades_Controller),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Costo de inversion", Icons.attach_money,
                      false, TextInputType.number, costo_Controller),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Precio de venta", Icons.attach_money,
                      false, TextInputType.number, precio_Controller),
                  SizedBox(height: 20.0),
                  textFormFieldNumber("Utilidad", Icons.attach_money, false,
                      TextInputType.number, utilidad_Controller),
                  SizedBox(height: 30.0),
                  elevatedButtonGuardar(context, _formKey, (){

                  }),
                  textButtonCancelar(context),
                  SizedBox(height: 90.0),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget textFormFieldNumber(String hintText, IconData icon, bool obscureText,
    TextInputType textInputType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white60),
      prefixIcon: Icon(
        icon,
        color: Colors.white60,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.3),
    ),
    keyboardType: textInputType,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese su $hintText';
      }
      return null;
    },
  );
}
