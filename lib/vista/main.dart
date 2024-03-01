import 'package:flutter/material.dart';
import 'package:flutter_application_12/vista/Clientes.dart';
import 'package:flutter_application_12/vista/Usuario.dart';
import 'package:flutter_application_12/vista/Ventas.dart';
import 'package:flutter_application_12/vista/carrito.dart';
import 'package:flutter_application_12/vista/almacen.dart';
import 'package:flutter_application_12/vista/proveedores.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
   await Hive.openBox('productos');
   await Hive.openBox('proveedores');
   await Hive.openBox('clientes');
   await Hive.openBox('ventas');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Punto de venta',
      home: MyHomePage(title:'SimStore'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
Widget build(BuildContext context) {
  var total =0;
  List<String> selectedProducts = ['', '', '']; // Lista de productos seleccionados

  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 230, 117, 179),
      title: Row(
        children: [
          Text(widget.title),
                   Image.asset("Images/logo.png", height: 50, width: 50, fit: BoxFit.cover, ),

        ],
      ),
    ),
    drawer: Drawer( // Nuevo Drawer
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
        const  DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 117, 179),
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ), 
            ListTile(
            leading: const Icon(Icons.person_outlined),
            title: const Text('Usuario'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Usuario()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1_outlined),
            title: const Text('Clientes'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Clientes()));
                                    },
          ),
            ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Carrito de compras'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaCarrito()));

            },
          ),
             ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Ventas'),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VentanaVentas()));
            },
          ),
            ListTile(
            leading: const Icon(Icons.store_outlined),
            title: const Text('Almacén'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const Almacen()));
               
            },
          ),
          ListTile(
            leading: const Icon(Icons.call_outlined),
            title: const Text('Proveedores'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Proveedores()));
            },
          ),

        
         
        ],
      ),
    ),

    body: SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: <Widget>[
          Row(
            children: <Widget>[
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre o codigo del producto',
                  ),
                ),
              ),
               IconButton(
                      icon: const Icon(Icons.camera_alt_outlined),
                      onPressed: () {},
                    ),
            ],
          ),
          const SizedBox(height: 20,),
     
          SizedBox(height: 3000,
          child: Table(
  border: TableBorder.all(),
  children: const [
    TableRow(
      
      children: [
        TableCell(
          child: Text('Producto',textAlign: TextAlign.center,),
        ),
        TableCell(
          child: Text('Cantidad',textAlign: TextAlign.center),
        ),
        TableCell(
          child: Text('Precio',textAlign: TextAlign.center),
        ),
      ],
    ),
    TableRow(
      children: [
        TableCell(
          child: Text('Coca cola normal'),
        ),
        TableCell(
          child: Text('5'),
        ),
        TableCell(
          child: Text('\$20'),
        ),
      ],
    ),
    TableRow(
      children: [
        TableCell(
          child: Text('Escuis Manzana'),
        ),
        TableCell(
          child: Text('7'),
        ),
        TableCell(
          child: Text('\$20'),
        ),
      ],
    ),
    TableRow(
      children: [
        TableCell(
          child: Text('Pepsi'),
        ),
        TableCell(
          child: Text('4'),
        ),
        TableCell(
          child: Text('\$20'),
        ),
      ],
    ),
  ],
),),
           Container(
            
            height: 250, // Altura aumentada a 250
            color: const Color.fromARGB(255, 253, 253, 253), 
            child: ListView.builder( // Nuevo ListView.builder
              itemCount: selectedProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(selectedProducts[index]),
                );
              },
            ),
          ),
        ],
      ),
    ),
    
    bottomNavigationBar: const BottomAppBar( 
      color: Color.fromARGB(133, 248, 247, 248), 
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Total',
          style: TextStyle(color: Colors.black, ),textAlign: TextAlign.end, 
        ),
      ),
    ),

  );
  }
}
