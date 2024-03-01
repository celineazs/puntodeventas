import 'package:flutter/material.dart';
import 'package:flutter_application_12/modelo/Usuarios.dart';
class Usuario extends StatelessWidget {
  const Usuario({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VentanaUsuario(),
      title: "Usuario",

    );
  }
}
class VentanaUsuario extends StatefulWidget {
  const VentanaUsuario({super.key});
  
  @override
  State<VentanaUsuario> createState() => _VentanaUsuarioState();
}

class _VentanaUsuarioState extends State<VentanaUsuario> {
  final List<Usuarios> usuario = [];
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Usuarios"),
        backgroundColor: const Color.fromARGB(255, 230, 117, 179),
      ),
       body: Column(
        
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: usuario.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(usuario[index].nombre),
                  subtitle: Text('Es administrador: ${usuario[index].esAdmin ? 'Sí' : 'No'}'),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  agregarUsuario(context);
                },
                 style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 236, 171, 207),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
                child: const Text('Alta'),
              ),
              ElevatedButton(
                onPressed: () {
                  modificarUsuario(context);
                },
                 style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 236, 171, 207),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
                child: const Text('Modificar'),
              ),
              ElevatedButton(
                onPressed: () {
                  eliminarUsuario(context);
                },
                 style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 236, 171, 207),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
                child: const Text('Baja'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // metodos controlador 
  void mostrarMensajeError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(mensaje),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  // agregar usuario
  void agregarUsuario(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController contrasenaController = TextEditingController();
    bool esAdmin = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar Usuario'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de usuario',
                ),
              ),
              TextField(
                controller: contrasenaController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
              ),
              Row(
                children: [
                  const Text('Es administrador:'),
                  Checkbox(
                    value: esAdmin,
                    onChanged: (bool? value) {
                      setState(() {
                        esAdmin = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String nombre = nombreController.text;
                String contrasena = contrasenaController.text;

                if (nombre.isNotEmpty && contrasena.isNotEmpty && !usuario.any((usuario) => usuario.nombre == nombre)) {
                  usuario.add(Usuarios(nombre, contrasena, esAdmin));
                  Navigator.of(context).pop();
                  setState(() {});
                } else {
                  mostrarMensajeError(context, 'El nombre de usuario ya existe o es inválido');
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  // modificar usuario
  void modificarUsuario(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController contrasenaController = TextEditingController();
    bool esAdmin = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modificar Usuario'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de usuario',
                ),
              ),
              TextField(
                controller: contrasenaController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
              ),
              Row(
                children: [
                  const Text('Es administrador:'),
                  Checkbox(
                    value: esAdmin,
                    onChanged: (bool? value) {
                      setState(() {
                        esAdmin = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String nombre = nombreController.text;
                String contrasena = contrasenaController.text;

                Usuarios usuarioEncontrado = buscarUsuarioPorNombre(nombre);
                if (usuarioEncontrado.nombre.isNotEmpty) {
                  usuarioEncontrado.esAdmin = true ;
                  Navigator.of(context).pop();
                  setState(() {});
                } else {
                  mostrarMensajeError(context, 'Usuario no encontrado');
                }
              },
              child: const Text('Modificar'),
            ),
          ],
        );
      },
    );
  }

  Usuarios buscarUsuarioPorNombre(String nombre) {
    Usuarios usuariosEncontrado;
    try {
      usuariosEncontrado = usuario.firstWhere((usuarios) => usuarios.nombre == nombre);
    } catch (e) {
      usuariosEncontrado =   Usuarios('','',true);
    }
    return usuariosEncontrado;
  }

  // eliminar usuario
  void eliminarUsuario(BuildContext context) {
    TextEditingController nombreController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Usuario'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de usuario',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String nombre = nombreController.text;

                Usuarios usuarioEncontrado = buscarUsuarioPorNombre(nombre);
                if (usuarioEncontrado.nombre.isNotEmpty) {
                  usuario.remove(usuarioEncontrado);
                  Navigator.of(context).pop();
                  setState(() {});
                } else {
                  mostrarMensajeError(context, 'Usuario no encontrado');
                }
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}