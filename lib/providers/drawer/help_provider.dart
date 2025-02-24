// import 'package:flutter/material.dart';

// class DrawerHelpDataProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> _faqList = [
//     {
//       'question': 'What Does Flash Offer?',
//       'answers': [
//         'To open your very own Digital Bank Account.',
//         'To perform functions such as payments, balance check.',
//         'Set and manage daily budgets.',
//         'Plan and automate savings.',
//         'Invest in term deposits, insurance, and more.',
//       ],
//     },
//     {
//       'question': 'What Language can I use the app?',
//       'answers': [
//         'The app supports multiple languages including English.',
//         'Additional languages may be added soon.',
//       ],
//     },
//     {
//       'question': 'How secure is the app?',
//       'answers': [
//         'The app follows industry-standard security protocols.',
//         'Your data is encrypted and securely stored.',
//       ],
//     },
//     {
//       'question': 'What Language can I use the app?',
//       'answers': [
//         'The app supports multiple languages including English.',
//         'Additional languages may be added soon.',
//       ],
//     },
//     {
//       'question': 'What Language can I use the app?',
//       'answers': [
//         'The app supports multiple languages including English.',
//         'Additional languages may be added soon.',
//       ],
//     },
//   ];

//   final Map<int, bool> _expandedStatus = {};

//   List<Map<String, dynamic>> get faqList => _faqList;

//   Map<int, bool> get expandedStatus => _expandedStatus;

//   void toggleExpanded(int index) {
//     _expandedStatus[index] = !(_expandedStatus[index] ?? false);
//     notifyListeners();
//   }

//   void initializeStatus() {
//     if (_expandedStatus.isEmpty) {
//       for (int i = 0; i < _faqList.length; i++) {
//         _expandedStatus[i] = false;
//       }
//     }
//   }
// }

import 'package:app/utils/assest_image.dart';
import 'package:flutter/material.dart';

class DrawerHelpDataProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _faqList = [
    {
      'question': 'What Does Flash Offer?',
      'answers': [
        'To open your very own Digital Bank Account.',
        'To perform functions such as payments, balance check.',
        'Set and manage daily budgets.',
        'Plan and automate savings.',
        'Invest in term deposits, insurance, and more.',
      ],
    },
    {
      'question': 'What Language can I use the app?',
      'answers': [
        'The app supports multiple languages including English.',
        'Additional languages may be added soon.',
      ],
    },
    {
      'question': 'What Language can I use the app?',
      'answers': [
        'The app supports multiple languages including English.',
        'Additional languages may be added soon.',
      ],
    },
    {
      'question': 'What Does Flash Offer?',
      'answers': [
        'To open your very own Digital Bank Account.',
        'To perform functions such as payments, balance check.',
        'Set and manage daily budgets.',
        'Plan and automate savings.',
        'Invest in term deposits, insurance, and more.',
      ],
    },
    {
      'question': 'What Does Flash Offer?',
      'answers': [
        'To open your very own Digital Bank Account.',
        'To perform functions such as payments, balance check.',
        'Set and manage daily budgets.',
        'Plan and automate savings.',
        'Invest in term deposits, insurance, and more.',
      ],
    },
  ];

  final List<Map<String, dynamic>> _tipsList = [
    {
      'tipHeading': 'Tip 1',
      'message':
          'Hide your Balance using this hide icon, and when you want to show it.',
      'image': ImageAsset().authBg,
    },
    {
      'tipHeading': 'Tip 2',
      'message': 'Be aware of phishing scams. Always verify the source.',
      'image': ImageAsset().authBg,
    },
    {
      'tipHeading': 'Tip 3',
      'message': 'Use a strong password for your account security.',
      'image': ImageAsset().authBg,
    },
  ];

  // Expanded status map for FAQ (unchanged)
  final Map<int, bool> _expandedStatus = {};

  List<Map<String, dynamic>> get faqList => _faqList;

  Map<int, bool> get expandedStatus => _expandedStatus;

  List<Map<String, dynamic>> get tipsList => _tipsList;

  // Toggle FAQ expanded status
  void toggleExpanded(int index) {
    _expandedStatus[index] = !(_expandedStatus[index] ?? false);
    notifyListeners();
  }

  // Initialize the expanded status for FAQ
  void initializeStatus() {
    if (_expandedStatus.isEmpty) {
      for (int i = 0; i < _faqList.length; i++) {
        _expandedStatus[i] = false;
      }
    }
  }
}
