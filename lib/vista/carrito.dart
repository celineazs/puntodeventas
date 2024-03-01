import 'package:flutter/material.dart';
void main(){
  runApp(const Carrito());
  
}
class Carrito extends StatelessWidget {
  const Carrito({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaCarrito(),
      title: "Carrito",
      debugShowCheckedModeBanner: false,
    );
  }
}
class VentanaCarrito extends StatefulWidget {
  const VentanaCarrito({super.key});
  
  @override
  State<VentanaCarrito> createState() => _VentanaCarritoState();
}

class _VentanaCarritoState extends State<VentanaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Carrito de compras"),
        backgroundColor: const Color.fromARGB(255, 230, 117, 179),
      ),
       body: const Padding(padding: EdgeInsets.all(10),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start, 
        children: <Widget>[
           
          SizedBox(height: 10,),
        
        ],
        
        
        
      ),
      ),
      
     );
  }
  
}