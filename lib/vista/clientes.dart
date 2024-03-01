import 'package:flutter/material.dart';
import 'package:flutter_application_12/vista/agregarclientes.dart';
import 'package:flutter_application_12/modelo/Cliente.dart';
import 'package:flutter_application_12/controlador/controlador_cliente.dart';
import 'package:flutter_application_12/vista/modiclientes.dart';

import 'package:hive_flutter/hive_flutter.dart';
void main() {
  runApp(const Clientes());
}
class Clientes extends StatefulWidget {
  const Clientes({super.key});
  @override
  State<Clientes> createState() => _ClientesState();
}
  class _ClientesState extends State<Clientes> {
    List<Cliente> clientes=[];
    @override
    void initState(){
      super.initState();
      clientes=obtenerClientes();
    }
  List<Cliente> obtenerClientes() {
    var clientesBox = Hive.box('clientes');
    List<Cliente> listaCliente = [];
    for (var key in clientesBox.keys) {
      var cliente = clientesBox.get(key);
      listaCliente.add(Cliente(
        id: cliente['id'],
        nombre: cliente['nombre'],
        telefono: cliente['telefono'],
        correo: cliente['correo'],
      ));
    }
    return listaCliente;
  }
 Controlador_cliente Controlador = Controlador_cliente();

  @override
  Widget build(BuildContext context) {
  var clientes = obtenerClientes(); // Obteniendo la lista de clientes
  return Scaffold(
    appBar: AppBar(
      title: const Text('Clientes'),
      backgroundColor: const Color.fromARGB(255, 230, 117, 179),
    ),
    body: Column(
      children: [
        const SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                  
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaAgregarclientes()));

                setState(() {
                clientes = obtenerClientes();
                });
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 236, 171, 207),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('Alta'),
            ),
            ElevatedButton(
              onPressed: () {
                  
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaModiclientes()));

                setState(() {
                clientes = obtenerClientes();
                });
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 236, 171, 207),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('Modificar'),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: clientes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(clientes[index].nombre),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${clientes[index].id}'),
                    Text('Telefono: ${clientes[index].telefono.toStringAsFixed(2)}'),
                    Text('Correo: ${clientes[index].correo}'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      Controlador.eliminarCliente(clientes[index].id);
                    });
                  },
                ),
                
              );
              
            },
          ),
        ),
       
      ],
    ),
  );
}

  }