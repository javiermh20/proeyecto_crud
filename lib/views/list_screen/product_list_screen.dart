import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_crud/firebase/services/product_services.dart';
import 'package:proyecto_crud/views/register_screens/product_register_screen.dart';

class ListProductsScreen extends StatelessWidget {
  const ListProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data?[index]['Imagen']),
                        ),
                        title: Text(
                          snapshot.data?[index]['Nombre'],
                          style:
                              TextStyle(fontFamily: 'Pacifico', fontSize: 20.0),
                        ),
                        textColor: Colors.white,
                        subtitle: Text(
                          snapshot.data?[index]['Descripcion'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.edit_note_rounded),
                          color: Colors.white,
                          onPressed: () {
                            // Aquí se puede agregar la lógica para eliminar un producto

                          },
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí se agrega que abra el formulario para agregar un producto
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterProductScreen(),
            ),
          );
        },
        backgroundColor: Colors.white70,
        child: Icon(Icons.add, color: Colors.purple[700]),
      ),
    );
  }
}

Widget elevatedButtonAgregar(context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
    child: Text(
      'Agregar',
      style: TextStyle(
        color: Colors.purple[700],
        letterSpacing: 2.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterProductScreen(),
        ),
      );
    },
  );
}
