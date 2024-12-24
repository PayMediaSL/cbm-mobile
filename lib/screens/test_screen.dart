// class CustomBottomNavBarExample extends StatefulWidget {
//   @override
//   _CustomBottomNavBarExampleState createState() =>
//       _CustomBottomNavBarExampleState();
// }

// class _CustomBottomNavBarExampleState extends State<CustomBottomNavBarExample> {
//   int _selectedIndex = 0;

//   final List<Map<String, dynamic>> _navItems = [
//     {"icon": Icons.home, "label": "Home"},
//     {"icon": Icons.payment, "label": "Payments"},
//     {"icon": Icons.grid_view, "label": "Lifestyle"},
//     {"icon": Icons.swap_horiz, "label": "sd"},
//     {"icon": Icons.menu, "label": "Menu"},
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Selected: ${_navItems[_selectedIndex]["label"]}',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.red,
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(_navItems.length, (index) {
//             final isSelected = _selectedIndex == index;

//             return GestureDetector(
//               onTap: () => _onItemTapped(index),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Bar above the container (outside of it)
//                   AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     height: isSelected ? 4 : 0,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.blue : Colors.transparent,
//                       // borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                   // const SizedBox(height: 4),

//                   // Container with icon and text inside (fixed width)
//                   Container(
//                     width: 60, // Fixed width for all containers
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.blue.withOpacity(0.2) : null,
//                       // borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           _navItems[index]["icon"],
//                           color: isSelected ? Colors.blue : Colors.grey,
//                           size: 20,
//                         ),
//                         // const SizedBox(height: 4),
//                         Text(
//                           _navItems[index]["label"],
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: isSelected ? Colors.blue : Colors.grey,
//                             fontSize: 11,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

//! Latesttt
// import 'package:flutter/material.dart';

// class CustomBottomNavBarExample extends StatefulWidget {
//   @override
//   _CustomBottomNavBarExampleState createState() =>
//       _CustomBottomNavBarExampleState();
// }

// class _CustomBottomNavBarExampleState extends State<CustomBottomNavBarExample> {
//   int _selectedIndex = 0;

//   final List<Map<String, dynamic>> _navItems = [
//     {"icon": Icons.home, "label": "Home"},
//     {"icon": Icons.payment, "label": "Payments"},
//     {"icon": Icons.grid_view, "label": "Lifestyle"},
//     {"icon": Icons.swap_horiz, "label": "Transactions"},
//     {"icon": Icons.menu, "label": "Menu"},
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Selected: ${_navItems[_selectedIndex]["label"]}',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 6),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: List.generate(_navItems.length, (index) {
//             final isSelected = _selectedIndex == index;

//             return GestureDetector(
//               onTap: () => _onItemTapped(index),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Bar above the container (outside it)
//                   AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     height: isSelected ? 4 : 0,
//                     width: 70,
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.blue : Colors.transparent,
//                     ),
//                   ),
//                   const SizedBox(height: 4),

//                   // Main container with icon and text
//                   Container(
//                     width: isSelected ? 80 : 70,
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.blue.withOpacity(0.2) : null,
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           _navItems[index]["icon"],
//                           color: isSelected ? Colors.blue : Colors.grey,
//                           size: 24,
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           _navItems[index]["label"],
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: isSelected ? Colors.blue : Colors.grey,
//                             fontSize: 11,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomBottomNavBarExample extends StatefulWidget {
  @override
  _CustomBottomNavBarExampleState createState() =>
      _CustomBottomNavBarExampleState();
}

class _CustomBottomNavBarExampleState extends State<CustomBottomNavBarExample> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.payment, "label": "Payments"},
    {"icon": Icons.grid_view, "label": "Lifestyle"},
    {"icon": Icons.swap_horiz, "label": "Transactions"},
    {"icon": Icons.menu, "label": "Menu"},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Selected: ${_navItems[_selectedIndex]["label"]}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none, // Ensures the animated bar is visible outside
        children: [
          // Main Bottom Navigation Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_navItems.length, (index) {
                final isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: Container(
                    width: isSelected ? 80 : 70, // Expands when selected
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.withOpacity(0.2) : null,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _navItems[index]["icon"],
                          color: isSelected ? Colors.blue : Colors.grey,
                          size: 24,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _navItems[index]["label"],
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          // Animated Bar Positioned Above the Container
          Positioned(
            top:
                -6, // Adjust this value to control how far above the bar should be
            left: _selectedIndex *
                    (MediaQuery.of(context).size.width / _navItems.length) +
                (MediaQuery.of(context).size.width / _navItems.length / 2 - 35),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 4,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
