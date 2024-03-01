import 'package:flutter/material.dart';
import 'package:flutter_application_12/controlador/controlador_almacen.dart';
import 'package:flutter_application_12/vista/modiproductos.dart';
import 'package:flutter_application_12/modelo/Producto.dart';
import 'package:flutter_application_12/vista/agregarproductos.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() {
  runApp(const Almacen());
}
class Almacen extends StatefulWidget {
  const Almacen({super.key});
  @override
  State<Almacen> createState() => _AlmacenState();
}
  class _AlmacenState extends State<Almacen> {
    List<Producto> productos=[];
    @override
    void initState(){
      super.initState();
      productos=obtenerProductos();
    }
  List<Producto> obtenerProductos() {
    var productosBox = Hive.box('productos');
    List<Producto> listaProducto = [];
    for (var key in productosBox.keys) {
      var producto = productosBox.get(key);
      listaProducto.add(Producto(
        id: producto['id'],
        nombre: producto['nombre'],
        precio: producto['precio'],
        stock: producto['stock'],
      ));
    }
    return listaProducto;
  }
 Controlador_almacen Controlador = Controlador_almacen();

  @override
  Widget build(BuildContext context) {
  var productos = obtenerProductos(); // Obteniendo la lista de productos
  return Scaffold(
    appBar: AppBar(
      title: const Text('Almacen de productos'),
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
                  
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaAgregarproductos()));

                setState(() {
                productos = obtenerProductos();
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
                  
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaModiproductos()));

                setState(() {
                productos = obtenerProductos();
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
            itemCount: productos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(productos[index].nombre),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${productos[index].id}'),
                    Text('Precio: \$${productos[index].precio.toStringAsFixed(2)}'),
                    Text('Stock: ${productos[index].stock}'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      Controlador.eliminarProducto(productos[index].id);
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