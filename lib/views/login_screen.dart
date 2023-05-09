import 'package:flutter/material.dart';
import 'package:proyecto_crud/views/user/user_screen.dart';
import 'package:proyecto_crud/views/register_screens/user_register_screen2.dart';

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

Widget imagenLogin() {
  return Image(
    image: AssetImage('assets/images/user.png'),
    height: 200.0,
    color: Colors.white70,
  );
}

Widget textFormFieldUsuario() {
  return TextFormField(
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: 'Usuario',
      hintStyle: TextStyle(color: Colors.white60),
      prefixIcon: Icon(
        Icons.person,
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
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese su usuario';
      }
      return null;
    },
  );
}

Widget textFormFieldPassword() {
  return TextFormField(
    obscureText: true,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: 'Contraseña',
      hintStyle: TextStyle(color: Colors.white60),
      prefixIcon: Icon(
        Icons.lock,
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
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese su contraseña';
      }
      return null;
    },
  );
}

Widget elevatedButtonIniciar(context, _formKey) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
    child: Text(
      'INICIAR SESIÓN',
      style: TextStyle(
        color: Colors.purple[700],
        letterSpacing: 2.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        // código para enviar el formulario
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreen(),
          ),
        );
      } else {
        // Alerta de formulario incorrecto
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Inicio incorrecto'),
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

Widget textButtonRegistrar(context) {
  return TextButton(
    child: Text(
      'REGISTRARSE',
      style: TextStyle(
        color: Colors.white70,
        letterSpacing: 2.0,
      ),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterUserScreen(),
        ),
      );
    },
  );
}
