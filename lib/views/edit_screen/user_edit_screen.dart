import 'package:flutter/material.dart';
import 'package:proyecto_crud/firebase/services/user_services.dart';
import '../widgets_genericos.dart';

class EditUserScreen extends StatefulWidget {
  final Map arguments;

  EditUserScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController(text: "");
  TextEditingController _nombreController = TextEditingController(text: "");
  TextEditingController _apellidoController = TextEditingController(text: "");
  TextEditingController _imagenController = TextEditingController(text: "");
  TextEditingController _edadController = TextEditingController(text: "");
  String _selectedGenero = 'Masculino';
  TextEditingController _correoController = TextEditingController(text: "");
  TextEditingController _contrasenaController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _idController.text = widget.arguments['id'];
    _nombreController.text = widget.arguments['nombre'];
    _apellidoController.text = widget.arguments['apellido'];
    _imagenController.text = widget.arguments['imagen'];
    _edadController.text = widget.arguments['edad'];
    _correoController.text = widget.arguments['correo'];
    _contrasenaController.text = widget.arguments['password'];
  }

  void modificarUsuario() {
    updateUsers(
      widget.arguments['uid'],
      _idController.text,
      _nombreController.text,
      _apellidoController.text,
      _imagenController.text,
      _edadController.text,
      _selectedGenero,
      _correoController.text,
      _contrasenaController.text,
    );
  }

  void eliminarUsuario() {
    deleteUsers(widget.arguments['uid']);
  }

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
                  "ID Usuario",
                  Icons.add_box,
                  false,
                  TextInputType.text,
                  controller: _idController,
                ),
                SizedBox(height: 20.0),
                textFormField(
                  "Nombre",
                  Icons.person,
                  false,
                  TextInputType.text,
                  controller: _nombreController,
                ),
                SizedBox(height: 20.0),
                textFormField(
                  "Apellido",
                  Icons.person,
                  false,
                  TextInputType.text,
                  controller: _apellidoController,
                ),
                SizedBox(height: 20.0),
                textFormField(
                  'Imagen',
                  Icons.image,
                  false,
                  TextInputType.text,
                  controller: _imagenController,
                ),
                SizedBox(height: 20.0),
                textFormFieldNumber(
                  "Edad",
                  Icons.calendar_today,
                  false,
                  TextInputType.number,
                  controller: _edadController,
                ),
                SizedBox(height: 20.0),
                Container(
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
                        value: _selectedGenero,
                        decoration: InputDecoration(
                          icon: Icon(Icons.wc, color: Colors.white60),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, color: Colors.white70),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGenero = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Por favor seleccione su genero';
                          }
                          return null;
                        },
                        dropdownColor: Colors.purple[700],
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'Masculino',
                            child: Text('Masculino'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Femenino',
                            child: Text('Femenino'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'No binario',
                            child: Text('No binario'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Otro',
                            child: Text('Otro'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                textFormField(
                  "Correo",
                  Icons.mail,
                  false,
                  TextInputType.text,
                  controller: _correoController,
                ),
                SizedBox(height: 20.0),
                textFormField(
                  "Contraseña",
                  Icons.lock,
                  false,
                  TextInputType.text,
                  controller: _contrasenaController,
                ),
                SizedBox(height: 30.0),
                elevatedButtonGuardar(context, _formKey, modificarUsuario),
                elevatedButtonEliminar(
                  context,
                  widget.arguments['uid'],
                  widget.arguments['nombre'],
                  eliminarUsuario,
                ),
                textButtonCancelar(context),
                SizedBox(height: 200.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
