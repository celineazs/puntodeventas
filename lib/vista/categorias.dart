import 'package:flutter/material.dart';
import 'package:flutter_application_12/modelo/categoria.dart';
import 'package:flutter_application_12/vista/crear_categoriavista.dart';

class CategoriasVista extends StatefulWidget {
  const CategoriasVista({super.key});

  @override
  State<CategoriasVista> createState() => _CategoriasVistaState();
}

class _CategoriasVistaState extends State<CategoriasVista> {
 
  List<Categoria> categorias = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorías'),
        ),
        body: Center(
          child: Column(children: [
            for (int i = 0; i < categorias.length; i++)
              ListTile(
                title: Text(categorias[i].nombre),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.teal.shade300,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.shade300,
                      ),
                      onPressed: () {
                        
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CrearCategoriaVista(),
              ),
            ).whenComplete(() => setState(() {}));
          },
          child: const Icon(Icons.add),
        ));
  }
}