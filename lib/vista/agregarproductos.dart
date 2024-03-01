import 'package:flutter/material.dart';
import 'package:flutter_application_12/controlador/controlador_almacen.dart';
import 'package:flutter_application_12/modelo/Producto.dart';

class Agregarproductos extends StatelessWidget {
  const Agregarproductos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaAgregarproductos(),
      title: "Alta",
      debugShowCheckedModeBanner: false,
    );
  }
}

class VentanaAgregarproductos extends StatefulWidget {
  const VentanaAgregarproductos({Key? key}) : super(key: key);

  @override
  State<VentanaAgregarproductos> createState() => _VentanaAgregarproductosState();
}
class _VentanaAgregarproductosState extends State<VentanaAgregarproductos> {
  Controlador_almacen controlador = Controlador_almacen();
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Productos"),
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
                bool productoAgregado = controlador.agregarproductos(producto);
                 Navigator.of(context).pop();
                                 

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(productoAgregado ? "Producto Agregado" : "Error"),
                      content: Text(productoAgregado ? "El producto se agregó correctamente." : "Error al agregar el producto."),
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
