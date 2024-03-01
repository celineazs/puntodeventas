import 'package:flutter/material.dart';
import 'package:flutter_application_12/controlador/controlador_proveedor.dart';
import 'package:flutter_application_12/modelo/Proveedor.dart';

class Agregarproveedores extends StatelessWidget {
  const Agregarproveedores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaAgregarproveedores(),
      title: "Alta",
      debugShowCheckedModeBanner: false,
    );
  }
}

class VentanaAgregarproveedores extends StatefulWidget {
  const VentanaAgregarproveedores({Key? key}) : super(key: key);

  @override
  State<VentanaAgregarproveedores> createState() => _VentanaAgregarproveedoresState();
}
class _VentanaAgregarproveedoresState extends State<VentanaAgregarproveedores> {
  Controlador_proveedor controlador = Controlador_proveedor();
  TextEditingController idController = TextEditingController();
  TextEditingController empresaController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Proveedores"),
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
              controller: empresaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Empresa',
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
                String empresa = empresaController.text;
                int telefono = int.tryParse(telefonoController.text)!;
                String correo = correoController.text;
                Proveedor proveedor = Proveedor(id: id!, empresa: empresa, telefono: telefono, correo: correo);
                // Llamar al método agregarClientes y mostrar el diálogo
                bool proveedorAgregado = controlador.agregarProveedor(proveedor);
                 Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(proveedorAgregado ? "Proveedor Agregado" : "Error"),
                      content: Text(proveedorAgregado ? "El proveedor se agregó correctamente." : "Error al agregar el proveedor."),
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