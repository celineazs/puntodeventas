class Cliente{
  int id;
  String nombre;
  int telefono;
  String correo;

    Cliente({
    required this.id,
    required this.nombre,
    required this.telefono,
    required this.correo,
  });
  
  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'nombre':nombre,
      'telefono':telefono,
      'correo': correo,
      
    };
}
}