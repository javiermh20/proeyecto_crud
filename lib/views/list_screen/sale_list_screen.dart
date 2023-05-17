import 'package:flutter/material.dart';
import '../../firebase/services/sales_services.dart';

class ListSalesScreen extends StatefulWidget {
  const ListSalesScreen({Key? key}) : super(key: key);

  @override
  _ListSalesScreenState createState() => _ListSalesScreenState();
}

class _ListSalesScreenState extends State<ListSalesScreen> {
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
            future: getSales(),
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
                          snapshot.data?[index]['Total'] +
                              ' ' +
                              snapshot.data?[index]['Cantidad'] +
                              ' pz',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.edit_note_rounded),
                          color: Colors.white,
                          onPressed: () {
                            // Aquí se puede agregar la lógica para editar/eliminar un producto
                            Navigator.pushNamed(context, '/editSale',
                                arguments: {
                                  'id': snapshot.data?[index]['VentaId'],
                                  'productoId': snapshot.data?[index]
                                      ['ProductoId'],
                                  'nombre': snapshot.data?[index]['Nombre'],
                                  'cantidad': snapshot.data?[index]['Cantidad'],
                                  'clienteId': snapshot.data?[index]
                                      ['ClienteId'],
                                  'piezas': snapshot.data?[index]['Piezas'],
                                  'total': snapshot.data?[index]['Total'],
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
              context, '/addSale' // 'addProduct' es el nombre de la ruta
              );
          setState(() {}); // actualizar el estado de la pantalla
        },
        backgroundColor: Colors.white70,
        child: Icon(Icons.add, color: Colors.purple[700]),
      ),
    );
  }
}
