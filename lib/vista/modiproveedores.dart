import 'package:flutter/material.dart';
import 'package:flutter_application_12/controlador/controlador_proveedor.dart';
import 'package:flutter_application_12/modelo/Proveedor.dart';

class Modiproveedores extends StatelessWidget {
  const Modiproveedores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaModiproveedores(),
      title: "Modificar Provedores",
      debugShowCheckedModeBanner: false,
    );
  }
}

class VentanaModiproveedores extends StatefulWidget {
  const VentanaModiproveedores({Key? key}) : super(key: key);

  @override
  State<VentanaModiproveedores> createState() => _VentanaModiproveedoresState();
}
class _VentanaModiproveedoresState extends State<VentanaModiproveedores> {
  Controlador_proveedor controlador = Controlador_proveedor();
  TextEditingController idController = TextEditingController();
  TextEditingController empresaController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar  Proveedores"),
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
                // Llamar al método agregarProveedores y mostrar el diálogo
                bool proveedorModificado = controlador.modificarProveedor(proveedor); 
                 Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(proveedorModificado ? "Proveedor Modificado" : "Error"),
                      content: Text(proveedorModificado ? "El proveedor se Modifico correctamente." : "Error al modificar el proveedor."),
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