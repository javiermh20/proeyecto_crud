import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        Navigator.pushNamed(context, '/userScreen');
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
      Navigator.pushNamed(context, '/addUser');
    },
  );
}

Widget textFormField(
    String hintText, IconData icon, bool obscureText, TextInputType type,
    {TextEditingController? controller}) {
  return TextFormField(
    controller: controller,
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

Widget textEditFormField(String hintText, IconData icon, bool obscureText,
    String valor, TextInputType type, context,
    {TextEditingController? controller}) {
  final Map<String, dynamic> arguments =
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  controller?.text = arguments[valor];

  return TextFormField(
    controller: controller,
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

Widget textFormFieldNumber(String hintText, IconData icon, bool obscureText,
    TextInputType textInputType,
    {TextEditingController? controller}) {
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

Widget containerDropDownButton(_selectGender, setState) {
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

Widget elevatedButtonGuardar(BuildContext context, GlobalKey<FormState> formKey,
    Function guardarFuncion) {
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
    onPressed: () async {
      if (formKey.currentState!.validate()) {
        // Código para enviar el formulario
        await guardarFuncion();
        Navigator.pop(context);
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

Widget elevatedButtonEliminar(
    BuildContext context, String uid, String name, Function eliminarFuncion) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
    ),
    child: Text(
      'ELIMINAR',
      style: TextStyle(
        color: Colors.purple[700],
        letterSpacing: 2.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () async {
      //Funcion eliminar
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Eliminar'),
              content: Text(
                  '¿Está seguro que desea eliminar este elemento:  $name?'),
              actions: [
                textButtonCancelarEdit(context),
                textButtonEliminar(context, eliminarFuncion),
              ],
            );
          }).then((value) => {
            Navigator.pop(context),
          });
    },
  );
}

Widget textButtonEliminar(BuildContext context, Function eliminarFuncion) {
  return TextButton(
    child: Text(
      'ELIMINAR',
      style: TextStyle(
        color: Colors.purple[700],
        letterSpacing: 2.0,
      ),
    ),
    onPressed: () async {
      await eliminarFuncion();
      Navigator.pop(context);
    },
  );
}

Widget imagenConfiguracion() {
  return Image(
    image: AssetImage('assets/images/opciones.png'),
    height: 180.0,
    fit: BoxFit.cover,
    color: Colors.white70,
  );
}

Widget textOpciones() {
  return Text(
    'Opciones',
    style: TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 40.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget cardMenuRegister(context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.purple[700],
      ),
      title: Text(
        'Registrar',
        style: TextStyle(
          color: Colors.purple[700],
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/menuScreen');
      },
    ),
  );
}

Widget cardMenuSales(context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        Icons.attach_money,
        color: Colors.purple[700],
      ),
      title: Text(
        'Ventas',
        style: TextStyle(
          color: Colors.purple[700],
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/listSales');
      },
    ),
  );
}

Widget cardPurchase(context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        Icons.shopping_cart,
        color: Colors.purple[700],
      ),
      title: Text(
        'Compras',
        style: TextStyle(
          color: Colors.purple[700],
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/listPurchase');
      },
    ),
  );
}

Widget textButtonCancelar(context) {
  return TextButton(
    child: Text(
      'CANCELAR',
      style: TextStyle(
        color: Colors.white60,
        letterSpacing: 2.0,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

Widget textButtonCancelarEdit(context) {
  return TextButton(
    child: Text(
      'CANCELAR',
      style: TextStyle(
        color: Colors.black,
        letterSpacing: 2.0,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

Widget imageRegistrar() {
  return Image(
    image: AssetImage('assets/images/registrar.png'),
    height: 180.0,
    fit: BoxFit.cover,
    color: Colors.white70,
  );
}

Widget textRegistrar() {
  return Text(
    'Registrar',
    style: TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 40.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget cardUsuario(context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.purple[700],
      ),
      title: Text(
        'Usuario',
        style: TextStyle(
          color: Colors.purple[700],
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/listUsers');
      },
    ),
  );
}

Widget cardProducto(context) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        Icons.add_box_rounded,
        color: Colors.purple[700],
      ),
      title: Text(
        'Producto',
        style: TextStyle(
          color: Colors.purple[700],
          fontFamily: 'Source Sans Pro',
          fontSize: 20.0,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/listProducts');
      },
    ),
  );
}
