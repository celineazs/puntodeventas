import 'package:flutter_application_12/modelo/Proveedor.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Controlador_proveedor{
  var proveedores = Hive.box('proveedores');

  bool agregarProveedor(Proveedor proveedor){
    if(!proveedores.containsKey(proveedor.id)){
      proveedores.put(proveedor.id, proveedor.toMap());
      return true;
    }else{
      return false;
    }
  }
  bool eliminarProveedor(int id){
    if(proveedores.containsKey(id)){
      proveedores.delete(id);
      return true;
    }
      return false;
    }
    bool modificarProveedor(Proveedor proveedor){
      try{
        proveedores.put(proveedor.id, proveedor.toMap());
        return true;
      }catch(e) {
        return false;
      }
    }
  }