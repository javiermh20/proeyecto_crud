import 'package:flutter/material.dart';
import '../widgets_genericos.dart';

class MenuRegisterScreen extends StatelessWidget {
  const MenuRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                imageRegistrar(),
                SizedBox(height: 30),
                textRegistrar(),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(color: Colors.white60),
                ),
                cardUsuario(context),
                cardProducto(context),
                textButtonCancelar(context),
              ],
            )));
  }
}
