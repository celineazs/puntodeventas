
import 'package:flutter_application_12/modelo/categoria.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoriasController {
  List<Categoria> obtenerCategorias() {
    var box = Hive.box('categorias');
    List<Categoria> categorias = [];
    for (var i = 0; i < box.length; i++) {
      var categoria = Categoria();
      categoria.nombre = box.getAt(i);
      categorias.add(categoria);
    }
    return categorias;
  }

  void eliminarCategoria(int index) {
    var box = Hive.box('categorias');
    box.deleteAt(index);
  }
}