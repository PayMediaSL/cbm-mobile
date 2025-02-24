// import 'package:flutter/material.dart';

// class DrawerInfoProvider with ChangeNotifier {
//   final List<Map<String, String>> _allRates = [
//     {
//       'currency': 'USD',
//       'digital': 'Online Banking',
//       'buying': '100',
//       'cheque': '98'
//     },
//     {
//       'currency': 'EUR',
//       'digital': 'Mobile App',
//       'buying': '200',
//       'cheque': '195'
//     },
//     {'currency': 'GBP', 'digital': 'ATM', 'buying': '150', 'cheque': '145'},
//     {
//       'currency': 'AUD',
//       'digital': 'Bank Branch',
//       'buying': '110',
//       'cheque': '105'
//     },
//     {
//       'currency': 'CAD',
//       'digital': 'Web Portal',
//       'buying': '130',
//       'cheque': '125'
//     },
//     {'currency': 'JPY', 'digital': 'Agency', 'buying': '120', 'cheque': '115'},
//     {
//       'currency': 'CNY',
//       'digital': 'Merchant',
//       'buying': '140',
//       'cheque': '135'
//     },
//   ];

//   bool _showAll = false;
//   bool get showAll => _showAll;

//   List<Map<String, String>> get displayedRates {
//     return _showAll ? _allRates : _allRates.take(5).toList();
//   }

//   void toggleView() {
//     _showAll = !_showAll;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class DrawerInfoProvider with ChangeNotifier {
  // Initial dummy data for two APIs with different structures
  final Map<String, List<Map<String, String>>> _apiRates = {
    'api1': [
      {'currency': 'USD', 'digital': '200', 'buying': '210', 'cheque': '215'},
      {'currency': 'EUR', 'digital': '220', 'buying': '230', 'cheque': '235'},
      {'currency': 'GBP', 'digital': '240', 'buying': '250', 'cheque': '255'},
      {'currency': 'AUD', 'digital': '260', 'buying': '270', 'cheque': '275'},
      {'currency': 'CAD', 'digital': '280', 'buying': '290', 'cheque': '295'},
      {'currency': 'JPY', 'digital': '300', 'buying': '310', 'cheque': '315'},
      {'currency': 'INR', 'digital': '320', 'buying': '330', 'cheque': '335'},
    ],
    'api2': [
      {
        'currency_code': 'USD',
        'digital_rate': '200',
        'buying_rate': '210',
        'cheque_rate': '215'
      },
      {
        'currency_code': 'EUR',
        'digital_rate': '220',
        'buying_rate': '230',
        'cheque_rate': '235'
      },
      {
        'currency_code': 'GBP',
        'digital_rate': '240',
        'buying_rate': '250',
        'cheque_rate': '255'
      },
      {
        'currency_code': 'AUD',
        'digital_rate': '260',
        'buying_rate': '270',
        'cheque_rate': '275'
      },
      {
        'currency_code': 'CAD',
        'digital_rate': '280',
        'buying_rate': '290',
        'cheque_rate': '295'
      },
      {
        'currency_code': 'JPY',
        'digital_rate': '300',
        'buying_rate': '310',
        'cheque_rate': '315'
      },
      {
        'currency_code': 'INR',
        'digital_rate': '320',
        'buying_rate': '330',
        'cheque_rate': '335'
      },
    ],
  };

  // Flags to toggle view for each API (using a map for scalability)
  final Map<String, bool> _showAllFlags = {
    'api1': false,
    'api2': false,
  };

  bool getShowAll(String api) => _showAllFlags[api] ?? false;

  // Reusable toggle method that works for both APIs
  void toggleView(String api) {
    _showAllFlags[api] = !_showAllFlags[api]!;
    notifyListeners();
  }

  // Reusable method to get displayed rates for both APIs
  List<Map<String, String>> getDisplayedRates(String api) {
    if (_showAllFlags[api]!) {
      return _apiRates[api]!;
    } else {
      return _apiRates[api]!.take(5).toList(); // Modify as needed
    }
  }
}
