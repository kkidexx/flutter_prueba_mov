import 'package:flutter/material.dart';

void main(){
  runApp(Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presión en el Mar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/wefwefwfwef.avif'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Cuerpo(context),
      ),
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Column(
    children: <Widget>[
      Text("Presión en el Mar"),
      CampoAltura(),
      BotonCalcular(context),
    ],
  );
}

Widget CampoAltura() {
  return Container(
    padding: EdgeInsets.all(10),
    child: TextField(
      controller: _altura,
      decoration: InputDecoration(hintText: "Ingresar altura en metros"),
      keyboardType: TextInputType.number,
    ),
  );
}

Widget BotonCalcular(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      alertarespuesta(context);
    },
    child: Text("Calcular Presión"),
  );
}

double calcularPresion() {
  double altura = double.tryParse(_altura.text) ?? 0.00;
  double densidadAguaMar = 1025; // kg/m^3
  double gravedad = 9.8; // m/s^2

  return densidadAguaMar * gravedad * altura;
}

void alertarespuesta(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Resultado"),
        content: Text("La presión en el mar es de ${calcularPresion()} Pa"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("CERRAR"),
          ),
        ],
      );
    },
  );
}

final TextEditingController _altura = TextEditingController();