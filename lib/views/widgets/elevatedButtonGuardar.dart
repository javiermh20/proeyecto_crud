import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class elevatedButtonGuardar extends StatelessWidget {
  final BuildContext context;
  final dynamic formKey;
  final Function funcionParaEnviarFormulario;

  elevatedButtonGuardar({
    required this.context,
    required this.formKey,
    required this.funcionParaEnviarFormulario,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30.0),
      ),
      child: Text(
        'GUARDAR',
        style: TextStyle(
          color: Colors.purple[700],
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // código para enviar el formulario
          funcionParaEnviarFormulario();
        } else {
          // Alerta de formulario incorrecto
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Registro incorrecto'),
                content:
                    Text('Por favor ingrese todos los campos correctamente'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}