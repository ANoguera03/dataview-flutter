import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PastelScreen extends StatelessWidget {
  const PastelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3. Gráfico Circular (Proporciones)'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Uso de Almacenamiento del Teléfono',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Distribución porcentual que suma un 100% total.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PieChart(
                PieChartData(
                  sectionsSpace: 4,
                  centerSpaceRadius: 50,
                  sections: [
                    PieChartSectionData(value: 40, color: Colors.redAccent, title: 'Fotos 40%'),
                    PieChartSectionData(value: 30, color: Colors.blueAccent, title: 'Apps 30%'),
                    PieChartSectionData(value: 20, color: Colors.amber, title: 'Videos 20%'),
                    PieChartSectionData(value: 10, color: Colors.green, title: 'Otros 10%'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}