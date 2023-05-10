import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';
import 'package:proyecto_crud/views/widgets/textFieldWidget.dart';

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
                  textFormFieldNumber(hintText: "Unidades", icon: Icons.format_list_numbered,
                      obscureText: false, textInputType: TextInputType.number, controller: unidades_Controller),
                  SizedBox(height: 20.0),
                  textFormFieldNumber(hintText: "Costo de inversion", icon: Icons.attach_money,
                     obscureText: false, textInputType: TextInputType.number, controller: costo_Controller),
                  SizedBox(height: 20.0),
                  textFormFieldNumber(hintText: "Precio de venta", icon: Icons.attach_money,
                     obscureText: false, textInputType: TextInputType.number, controller: precio_Controller),
                  SizedBox(height: 20.0),
                  textFormFieldNumber(hintText: "Utilidad", icon: Icons.attach_money, obscureText: false,
                     textInputType: TextInputType.number, controller: utilidad_Controller),
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
