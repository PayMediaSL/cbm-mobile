// import 'package:flutter/material.dart';

// class NotificationScreen extends StatelessWidget {
//   final List<Map<String, String>> last7DaysNotifications = [
//     {
//       "title": "Bill Payment",
//       "time": "2 mins ago",
//       "description":
//           "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
//     },
//     {
//       "title": "Bill Payment",
//       "time": "9 hours ago",
//       "description":
//           "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
//     },
//   ];

//   final List<Map<String, String>> olderNotifications = [
//     {
//       "title": "Bill Payment",
//       "time": "05/24",
//       "description":
//           "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
//     },
//     {
//       "title": "Bill Payment",
//       "time": "05/24",
//       "description":
//           "The bill payment of LKR 100.00 to Airtel *****567 was a success!"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           _buildSectionTitle("Last 7 Days (${last7DaysNotifications.length})"),
//           ...last7DaysNotifications
//               .map((notification) => _buildNotificationTile(notification))
//               .toList(),
//           _buildSectionTitle("Older", viewAll: true),
//           ...olderNotifications
//               .map((notification) => _buildNotificationTile(notification))
//               .toList(),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title, {bool viewAll = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           if (viewAll)
//             TextButton(
//               onPressed: () {},
//               child:
//                   const Text("View all", style: TextStyle(color: Colors.blue)),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNotificationTile(Map<String, String> notification) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
//       child: Card(
//         elevation: 1,
//         child: ListTile(
//           leading: const Icon(Icons.receipt_long, color: Colors.blue),
//           title: Text(notification["title"]!),
//           subtitle: Text(notification["description"]!),
//           trailing: Text(
//             notification["time"]!,
//             style: const TextStyle(fontSize: 12, color: Colors.grey),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
