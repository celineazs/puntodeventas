import 'package:flutter/material.dart';
import 'package:flutter_application_12/controlador/controlador_almacen.dart';
import 'package:flutter_application_12/modelo/Producto.dart';

class Modiproductos extends StatelessWidget {
  const Modiproductos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaModiproductos(),
      title: "Modificar Productos",
      debugShowCheckedModeBanner: false,
    );
  }
}

class VentanaModiproductos extends StatefulWidget {
  const VentanaModiproductos({Key? key}) : super(key: key);

  @override
  State<VentanaModiproductos> createState() => _VentanaModiproductosState();
}
class _VentanaModiproductosState extends State<VentanaModiproductos> {
  Controlador_almacen controlador = Controlador_almacen();
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar Productos"),
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
              controller: stockController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Stock',
              ),
            ),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Precio',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int? id = int.tryParse(idController.text);
                String nombre = nombreController.text;
                double precio = double.tryParse(precioController.text) ?? 0.0;
                int stock = int.tryParse(stockController.text) ?? 0;
                Producto producto = Producto(id: id!, nombre: nombre, stock: stock, precio: precio);
                // Llamar al método agregarProductos y mostrar el diálogo
                bool productoModificado = controlador.modificarProducto(producto);
                 Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(productoModificado ? "Producto Modificado" : "Error"),
                      content: Text(productoModificado ? "El producto se Modifico correctamente." : "Error al modificar el producto."),
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