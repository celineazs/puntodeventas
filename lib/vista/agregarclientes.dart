import 'package:flutter/material.dart';
import 'package:flutter_application_12/controlador/controlador_cliente.dart';
import 'package:flutter_application_12/modelo/Cliente.dart';

class Agregarclientes extends StatelessWidget {
  const Agregarclientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaAgregarclientes(),
      title: "Alta",
      debugShowCheckedModeBanner: false,
    );
  }
}

class VentanaAgregarclientes extends StatefulWidget {
  const VentanaAgregarclientes({Key? key}) : super(key: key);

  @override
  State<VentanaAgregarclientes> createState() => _VentanaAgregarclientesState();
}
class _VentanaAgregarclientesState extends State<VentanaAgregarclientes> {
  Controlador_cliente controlador = Controlador_cliente();
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Clientes"),
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
                // Llamar al método agregarClientes y mostrar el diálogo
                bool clienteAgregado = controlador.agregarCliente(cliente);
                 Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(clienteAgregado ? "Cliente Agregado" : "Error"),
                      content: Text(clienteAgregado ? "El cliente se agregó correctamente." : "Error al agregar el cliente."),
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
              child: const Text('Alta'),
            ),
          ],
        ),
      ),
    );
  }
}
