import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textFormField extends StatelessWidget {
  final bool obscureText;
  final TextInputType type;
  final String hintText;
  final IconData icon;
  final TextEditingController sended_controller;

  textFormField({
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.type,
    required this.sended_controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: type,
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
      controller: sended_controller,
      validator: (s) {
        if (s?.isEmpty ?? true) {
          return 'Por favor ingrese su $hintText';
        }
        return null;
      },
    );
  }
}