import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarrasScreen extends StatelessWidget {
  const BarrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1. Gráfico de Barras (Gastos)'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    String text = '';
                    switch (value.toInt()) {
                      case 0: text = 'Comida'; break;
                      case 1: text = 'Transporte'; break;
                      case 2: text = 'Fiesta'; break;
                      case 3: text = 'Estudio'; break;
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 30, getTitlesWidget: (v, m) => Text('\$${v.toInt()}')),
              ),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: [
              _crearBarra(0, 70, Colors.teal),
              _crearBarra(1, 40, Colors.green),
              _crearBarra(2, 85, Colors.orange),
              _crearBarra(3, 30, Colors.blueGrey),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData _crearBarra(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y, color: color, width: 22, borderRadius: BorderRadius.circular(6)),
      ],
    );
  }
}