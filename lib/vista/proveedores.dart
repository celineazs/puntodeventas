import 'package:flutter/material.dart';
import 'package:flutter_application_12/vista/agregarproveedores.dart';
import 'package:flutter_application_12/modelo/Proveedor.dart';
import 'package:flutter_application_12/vista/modiproveedores.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_12/controlador/controlador_proveedor.dart';

class Proveedores extends StatefulWidget {
  const Proveedores({super.key});
  @override
  State<Proveedores> createState() => _ProveedoresState();
}
  class _ProveedoresState extends State<Proveedores> {
    List<Proveedor> proveedores=[];
    @override
    void initState(){
      super.initState();
      proveedores=obtenerProveedores();
    }
  List<Proveedor> obtenerProveedores() {
    var proveedoresBox = Hive.box('proveedores');
    List<Proveedor> listaProveedor = [];
    for (var key in proveedoresBox.keys) {
      var proveedor = proveedoresBox.get(key);
      listaProveedor.add(Proveedor(
        id: proveedor['id'],
        empresa: proveedor['empresa'],
        telefono: proveedor['telefono'],
        correo: proveedor['correo'],
      ));
    }
    return listaProveedor;
  }
 Controlador_proveedor Controlador = Controlador_proveedor();

  @override
  Widget build(BuildContext context) {
  var proveedores = obtenerProveedores(); // Obteniendo la lista de proveedores
  return Scaffold(
    appBar: AppBar(
      title: const Text('Proveedores'),
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
                  
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaAgregarproveedores()));

                setState(() {
                proveedores = obtenerProveedores();
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
                  
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaModiproveedores()));

                setState(() {
                proveedores = obtenerProveedores();
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
            itemCount: proveedores.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(proveedores[index].empresa),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${proveedores[index].id}'),
                    Text('Telefono: \$${proveedores[index].telefono.toStringAsFixed(2)}'),
                    Text('Correo: ${proveedores[index].correo}'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      Controlador.eliminarProveedor(proveedores[index].id);
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