import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/widgets_genericos.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50.0),
                imagenLogin(),
                SizedBox(height: 30.0),
                textFormFieldUsuario(),
                SizedBox(height: 20.0),
                textFormFieldPassword(),
                SizedBox(height: 50.0),
                elevatedButtonIniciar(context, _formKey),
                textButtonRegistrar(context),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
