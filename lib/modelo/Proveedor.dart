class Proveedor{
  int id;
  String empresa;
  int telefono;
  String correo;

   Proveedor({
    required this.id,
    required this.empresa,
    required this.telefono,
    required this.correo,
  });
  
  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'empresa':empresa,
      'telefono':telefono,
      'correo': correo,
      
    };
  }
}