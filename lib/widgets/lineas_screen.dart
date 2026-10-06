import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineasScreen extends StatelessWidget {
  const LineasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2. Gráfico de Líneas (Tendencias)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Variación de Temperatura Semanal (°C)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Muestra el comportamiento y la tendencia temporal.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: LineChart(
                LineChartData(
                  // 1. Definimos los límites exactos de los 6 días (de 0 a 5)
                  minX: 0,
                  maxX: 5,
                  minY: 19,
                  maxY: 36,
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32, // Espacio para los números de la izquierda
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1, // 2. Forzamos que los títulos salgan de 1 en 1 exacto
                        getTitlesWidget: (value, meta) {
                          String dia = '';
                          switch (value.toInt()) {
                            case 0: dia = 'Lun'; break;
                            case 1: dia = 'Mar'; break;
                            case 2: dia = 'Mié'; break;
                            case 3: dia = 'Jue'; break;
                            case 4: dia = 'Vie'; break;
                            case 5: dia = 'Sáb'; break;
                            default: return const Text('');
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              dia,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.indigo,
                      barWidth: 4,
                      dotData: const FlDotData(show: true),
                      spots: const [
                        FlSpot(0, 20), // Lunes
                        FlSpot(1, 24), // Martes
                        FlSpot(2, 22), // Miércoles
                        FlSpot(3, 30), // Jueves
                        FlSpot(4, 28), // Viernes
                        FlSpot(5, 35), // Sábado
                      ],
                    ),
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