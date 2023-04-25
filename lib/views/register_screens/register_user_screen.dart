import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({Key? key}) : super(key: key);

  @override
  _RegisterUserScreenState createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectGender;
  DateTime? _selectedDate;

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
                  textFormField(
                      "ID", Icons.person_2_outlined, false, TextInputType.text),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Nombre", Icons.person, false, TextInputType.text),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Apellido", Icons.person, false, TextInputType.text),
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
                      "Email", Icons.email, false, TextInputType.emailAddress),
                  SizedBox(height: 20.0),
                  textFormField(
                      "Password", Icons.lock, true, TextInputType.text),
                  SizedBox(height: 30.0),
                  elevatedButtonGuardar(context, _formKey),
                  textButtonCancelar(context),
                  SizedBox(height: 100.0),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget textFormField(
    String hintText, IconData icon, bool obscureText, TextInputType type) {
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
    validator: (value) {
      if (value!.isEmpty) {
        return 'Por favor ingrese su $hintText';
      }
      return null;
    },
  );
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

Widget elevatedButtonGuardar(context, _formKey) {
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
      if (_formKey.currentState!.validate()) {
        // código para enviar el formulario
      } else {
        // Alerta de formulario incorrecto
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registro incorrecto'),
              content: Text('Por favor ingrese todos los campos correctamente'),
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
