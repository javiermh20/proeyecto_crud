import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class containerDropdownButton extends StatelessWidget {
  final BuildContext context;
  final String delectGender;
  final dynamic setState;

  containerDropdownButton({
    required this.context,
    required this.delectGender,
    required this.setState
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


Widget containerDropDownButton(context, _selectGender, setState) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white.withOpacity(0.3),
    ),
    child: Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(),
      ),
      child: SizedBox(
        width: double.infinity,
        child: DropdownButtonFormField<String>(
          value: _selectGender,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
          iconSize: 24,
          elevation: 16,
          decoration: InputDecoration(
            icon: Icon(Icons.wc, color: Colors.white60),
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.white70),
            ),
          ),
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectGender = newValue;
            });
          },
          validator: (value) {
            if (value == null) {
              return 'Por favor seleccione su genero';
            }
            return null;
          },
          dropdownColor: Colors.purple[700],
          items: <String>['Masculino', 'Femenino', 'No binario', 'Otro']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    ),
  );
}