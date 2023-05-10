import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textFormFieldNumber extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;

  textFormFieldNumber({
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.textInputType,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
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
}