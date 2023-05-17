import 'package:flutter/material.dart';
import '../../firebase/services/purchase_services.dart';

class ListPurchaseScreen extends StatefulWidget {
  const ListPurchaseScreen({Key? key}) : super(key: key);

  @override
  _ListPurchaseScreenState createState() => _ListPurchaseScreenState();
}

class _ListPurchaseScreenState extends State<ListPurchaseScreen> {
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
            future: getPurchases(),
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
                        title: Text(
                          snapshot.data?[index]['Nombre'],
                          style:
                              TextStyle(fontFamily: 'Pacifico', fontSize: 20.0),
                        ),
                        textColor: Colors.white,
                        subtitle: Text(
                          snapshot.data?[index]['Precio'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.edit_note_rounded),
                          color: Colors.white,
                          onPressed: () {
                            // Aquí se puede agregar la lógica para editar/eliminar un producto
                            Navigator.pushNamed(context, '/editPurchase',
                                arguments: {
                                  'id': snapshot.data?[index]['CompraId'],
                                  'nombre': snapshot.data?[index]['Nombre'],
                                  'precio': snapshot.data?[index]['Precio'],
                                  'administradorId': snapshot.data?[index]
                                      ['AdministradorId'],
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
              context, '/addPurchase' // 'addProduct' es el nombre de la ruta
              );
          setState(() {}); // actualizar el estado de la pantalla
        },
        backgroundColor: Colors.white70,
        child: Icon(Icons.add, color: Colors.purple[700]),
      ),
    );
  }
}
