import 'package:flutter/material.dart';
import '../widgets/barras_screen.dart';
import '../widgets/lineas_screen.dart';
import '../widgets/pastel_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exposición: Visualización de Datos'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Selecciona el gráfico a demostrar:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                icon: const Icon(Icons.bar_chart),
                label: const Text('1. Gráfico de Barras'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BarrasScreen())),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                icon: const Icon(Icons.show_chart),
                label: const Text('2. Gráfico de Líneas'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LineasScreen())),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
                icon: const Icon(Icons.pie_chart),
                label: const Text('3. Gráfico Circular / Pastel'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PastelScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}