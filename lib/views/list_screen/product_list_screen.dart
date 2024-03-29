import 'package:flutter/material.dart';
import 'package:proyecto_crud/firebase/services/product_services.dart';

class ListProductsScreen extends StatefulWidget {
  const ListProductsScreen({Key? key}) : super(key: key);

  @override
  _ListProductsScreenState createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
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
                            // Aquí se puede agregar la lógica para editar/eliminar un producto
                            Navigator.pushNamed(context, '/editProduct',
                                arguments: {
                                  'id': snapshot.data?[index]['ProductoId'],
                                  'nombre': snapshot.data?[index]['Nombre'],
                                  'descripcion': snapshot.data?[index]
                                      ['Descripcion'],
                                  'imagen': snapshot.data?[index]['Imagen'],
                                  'unidades': snapshot.data?[index]['Unidades'],
                                  'costoInversion': snapshot.data?[index]
                                      ['Inversion'],
                                  'precioVenta': snapshot.data?[index]
                                      ['PVenta'],
                                  'utilidad': snapshot.data?[index]['Utilidad'],
                                  'uid': snapshot.data?[index]['uid'], // 'uid
                                });
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
        onPressed: () async {
          // Aquí se agrega que abra el formulario para agregar un producto
          await Navigator.pushNamed(
              context, '/addProduct' // 'addProduct' es el nombre de la ruta
              );
          setState(() {}); // actualizar el estado de la pantalla
        },
        backgroundColor: Colors.white70,
        child: Icon(Icons.add, color: Colors.purple[700]),
      ),
    );
  }
}
