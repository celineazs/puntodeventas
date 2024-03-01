import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_12/modelo/Producto.dart';

class Controlador_almacen{
  var productos = Hive.box('productos');

bool agregarproductos(Producto producto){
  if(!productos.containsKey(producto.id)){
    productos.put(producto.id, producto.toMap());
    return true;
  }else{
    return false;
  }
}
bool eliminarProducto(int id){
  if(productos.containsKey(id)){
    productos.delete(id);
    return true;
  }else{
    return false;
  }
}
bool modificarProducto(Producto producto){
  if(productos.containsKey(producto.id)){
    productos.put(producto.id, producto.toMap());
    return true;
  }else{
    return false;
  }
 }
}