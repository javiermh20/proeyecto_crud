import 'package:flutter/material.dart';
import 'package:proyecto_crud/firebase/models/product_model.dart';
import 'package:proyecto_crud/firebase/services/purchase_services.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

import '../widgets/containerDropdownButton.dart';
import '../widgets/elevatedButtonGuardar.dart';
import '../widgets/textFormField.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({Key? key}) : super(key: key);

  @override
  _RegisterUserScreenState createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectGender;
  DateTime? _selectedDate;

  TextEditingController id_Controller = TextEditingController();
  TextEditingController nombre_Controller = TextEditingController();
  TextEditingController apellido_Controller = TextEditingController();
  TextEditingController fecha_nacimiento_Controller = TextEditingController();
  TextEditingController sexo_Controller = TextEditingController();
  TextEditingController email_Controller = TextEditingController();
  TextEditingController password_Controller = TextEditingController();

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
                  textFormField(hintText: "ID", icon: Icons.person_2_outlined, obscureText: false,
                      type: TextInputType.text, sended_controller: id_Controller),
                  SizedBox(height: 20.0),
                  textFormField(hintText: "Nombre", icon: Icons.person, obscureText: false,
                      type: TextInputType.text, sended_controller: nombre_Controller),
                  SizedBox(height: 20.0),
                  textFormField(hintText: "Apellido", icon: Icons.person, obscureText: false,
                      type: TextInputType.text, sended_controller: apellido_Controller),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Fecha de nacimiento',
                      hintStyle: TextStyle(color: Colors.white60),
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.white60,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingrese su edad';
                      }
                      return null;
                    },
                    onTap: () async {
                      final DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _selectedDate = selectedDate;
                        });
                      }
                    },
                    readOnly: true,
                    controller: TextEditingController(
                        text: _selectedDate != null
                            ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                            : ""),
                  ),
                  SizedBox(height: 20.0),
                  containerDropDownButton(context, _selectGender, setState),
                  SizedBox(height: 20.0),
                  textFormField(
                     hintText: "Email", icon:Icons.email, obscureText:false, type:TextInputType.emailAddress, sended_controller: email_Controller),
                  SizedBox(height: 20.0),
                  textFormField(
                      hintText: "Password", icon: Icons.lock, obscureText: true, type: TextInputType.text,sended_controller: password_Controller),
                  SizedBox(height: 30.0),
                  elevatedButtonGuardar(context: context, formKey: _formKey,funcionParaEnviarFormulario: () {
                      var fechitaBonita = _selectedDate != null
                          ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                           "": "";
                      Producto produc = Producto(id: id_Controller.text, nombre: nombre_Controller.text, apellido: apellido_Controller.text, fecha_nacimiento: fechitaBonita, sexo: sexo_Controller.text, email: email_Controller.text, password: password_Controller.text);
                      agregarProducto(produc);
                  }),
                  textButtonCancelar(context),
                  SizedBox(height: 100.0),
                ],
              ),
            ),
          ),
        ));
  }
}