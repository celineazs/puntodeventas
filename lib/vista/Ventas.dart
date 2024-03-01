import 'package:flutter/material.dart';
import 'package:flutter_application_12/modelo/Producto.dart';
import 'package:flutter_application_12/modelo/Venta.dart';
void main(){
  runApp(const Ventas());
  
}
class Ventas extends StatelessWidget {
  const Ventas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaVentas(),
      title: "Ventas",
      debugShowCheckedModeBanner: false,
    );
  }
}
class VentanaVentas extends StatefulWidget {
  const VentanaVentas({super.key});
  
  @override
  State<VentanaVentas> createState() => _VentanaVentasState();
}

class _VentanaVentasState extends State<VentanaVentas> {
    final List<Venta> ventas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Ventas"),
        backgroundColor: const Color.fromARGB(255, 230, 117, 179),
      ),
        body: ListView.builder(
        itemCount: ventas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Factura #${ventas[index].numFactura}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fecha: ${ventas[index].fecha}'),
                Text('Total: ${ventas[index].total.toStringAsFixed(2)}'),
              ],
            ),
            onTap: () {
              // Aquí podrías mostrar más detalles de la venta si lo deseas
            },
          );
        },
      ),
    );
  }
}