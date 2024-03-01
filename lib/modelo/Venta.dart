import 'package:flutter_application_12/modelo/Producto.dart';

class Venta{
  int numFactura;
  String fecha;
  List<Producto> productos;
  double total;
  Venta(this.numFactura, this.fecha, this.productos, this.total);
}