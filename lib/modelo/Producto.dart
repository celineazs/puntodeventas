class Producto {
  int id;
  String nombre;
  double precio;
  int stock;

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.stock,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'precio': precio,
      'stock': stock,
    };
  }
}