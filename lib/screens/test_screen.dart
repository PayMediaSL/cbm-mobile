// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class BalanceSummaryChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Balance Summary',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Statistics',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade50,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       'Past 6 months',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: AspectRatio(
//                 aspectRatio: 1.7,
//                 child: LineChart(
//                   LineChartData(
//                     gridData: FlGridData(show: true),
//                     titlesData: FlTitlesData(
//                       leftTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: true, reservedSize: 40),
//                       ),
//                       bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           getTitlesWidget: (value, meta) {
//                             const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
//                             return Padding(
//                               padding: EdgeInsets.only(top: 8),
//                               child: Text(
//                                 months[value.toInt()],
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     borderData: FlBorderData(
//                       show: true,
//                       border: Border.all(color: Colors.grey.withOpacity(0.2)),
//                     ),
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: [
//                           FlSpot(0, 210000),
//                           FlSpot(1, 230000),
//                           FlSpot(2, 270000),
//                           FlSpot(3, 240000),
//                           FlSpot(4, 200000),
//                           FlSpot(5, 140000),
//                         ],
//                         isCurved: true,
//                         colors: [Colors.blueAccent],
//                         barWidth: 3,
//                         isStrokeCapRound: true,
//                         dotData: FlDotData(show: true),
//                         belowBarData: BarAreaData(
//                           show: true,
//                           colors: [Colors.blueAccent.withOpacity(0.3)],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
