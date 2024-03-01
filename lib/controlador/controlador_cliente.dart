import 'package:flutter_application_12/modelo/Cliente.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Controlador_cliente{
  var clientes = Hive.box('clientes');

  bool agregarCliente(Cliente cliente){
    if(!clientes.containsKey(cliente.id)){
      clientes.put(cliente.id, cliente.toMap());
      return true;
    }else{
      return false;
    }
  }
  bool eliminarCliente(int id){
    if(clientes.containsKey(id)){
      clientes.delete(id);
      return true;
    }
      return false;
    }
    bool modificarCliente(Cliente cliente){
      try{
        clientes.put(cliente.id, cliente.toMap());
        return true;
      }catch(e) {
        return false;
      }
    }
  }
