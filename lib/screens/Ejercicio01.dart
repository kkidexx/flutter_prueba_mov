import 'package:flutter/material.dart';

void main(){
  runApp(Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({super.key});

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
  TextEditingController velocidadInicialController = TextEditingController();
  TextEditingController velocidadFinalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba de Velocidad"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://scontent.fuio1-2.fna.fbcdn.net/v/t39.30808-6/296053147_110569341738320_3400158314867815508_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=lDEY9wkW7DYQ7kNvgFunDwD&_nc_ht=scontent.fuio1-2.fna&oh=00_AYA-o6j9wcp34Em1Gowl4qM4zLj0PCISC9rmQj-YrS4Jog&oe=6667953C'), 
            fit: BoxFit.cover,
          ),
        ),
        child: construirInterfaz(context),
      ),
    );
  }

  Widget construirInterfaz(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: velocidadInicialController,
            decoration: InputDecoration(labelText: 'Velocidad Inicial (m/s)'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: velocidadFinalController,
            decoration: InputDecoration(labelText: 'Velocidad Final (m/s)'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              calcularResultado(context);
            },
            child: Text('Calcular'),
          ),
        ],
      ),
    );
  }

  void calcularResultado(BuildContext context) {
    double velocidadInicial = double.tryParse(velocidadInicialController.text) ?? 0;
    double velocidadFinal = double.tryParse(velocidadFinalController.text) ?? 0;
    double aceleracionMedia = 10; 

    double tiempo = (velocidadFinal - velocidadInicial) / aceleracionMedia;

    if (tiempo < 0) {
      mostrarAlerta(context, 'El vehículo no prueba de velocidad.');
    } else {
      mostrarAlerta(context, 'El vehículo aprueba la  velocidad.');
    }
  }

  void mostrarAlerta(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}