import 'package:flutter/material.dart';
import 'package:flutter_application_12/controlador/controlador_cliente.dart';
import 'package:flutter_application_12/modelo/Cliente.dart';

class Modiclientes extends StatelessWidget {
  const Modiclientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaModiclientes(),
      title: "Modificar Clientes",
      debugShowCheckedModeBanner: false,
    );
  }
}

class VentanaModiclientes extends StatefulWidget {
  const VentanaModiclientes({Key? key}) : super(key: key);

  @override
  State<VentanaModiclientes> createState() => _VentanaModiclientesState();
}
class _VentanaModiclientesState extends State<VentanaModiclientes> {
  Controlador_cliente controlador = Controlador_cliente();
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar  Clientes"),
        backgroundColor: const Color.fromARGB(255, 230, 117, 179),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID',
              ),
            ),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
            TextField(
              controller: telefonoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefono',
              ),
            ),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int? id = int.tryParse(idController.text);
                String nombre = nombreController.text;
                int telefono = int.tryParse(telefonoController.text)!;
                String correo = correoController.text;
                Cliente cliente = Cliente(id: id!, nombre: nombre, telefono: telefono, correo: correo);
                // Llamar al método agregarProveedores y mostrar el diálogo
                bool clienteModificado = controlador.modificarCliente(cliente); 
                 Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(clienteModificado ? "Proveedor Modificado" : "Error"),
                      content: Text(clienteModificado ? "El proveedor se Modifico correctamente." : "Error al modificar el proveedor."),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Modificar'),
            ),
          ],
        ),
      ),
    );
  }
}