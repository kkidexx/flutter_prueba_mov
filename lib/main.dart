import 'package:flutter/material.dart';
import 'package:flutter_prueba_mov/screens/Ejercicio01.dart';
import 'package:flutter_prueba_mov/screens/Ejercicio02.dart';

 void main(){
  runApp(Prueba01());
 }

 class Prueba01 extends StatelessWidget {
  const Prueba01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Cuerpo(context),
      Ejercicio01(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tu Aplicación"),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.5), 
        child: screens[indice],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: "Ejercicio 01",
          ),
        ],
      ),
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Titulo(),
        Boton2(context),
      ],
    ),
  );
}

Widget Titulo() {
  return Column(
    children: const [
      Text(
        "Nombre del Estudiante: Andy Granda",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(
        "Usuario de GitHub: kkidexx",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
      SizedBox(height: 10),
    ],
  );
}

Widget Boton2(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ir al Ejercicio 02"),
            content: Text("¿Deseas ir al Ejercicio 02?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Ejercicio02()),
                  );
                },
                child: Text("Aceptar"),
              ),
            ],
          );
        },
      );
    },
    child: const Text("Ir al Ejercicio 02"),
  );
}