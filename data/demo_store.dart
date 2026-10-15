import 'package:flutter/material.dart';

// Shared session data. Restarting the app restores the sample records.
class DemoStore extends ChangeNotifier {
  static final instance = DemoStore();
  String name = 'Muhammad Usman';
  String email = 'usman@example.com';
  bool dark = false;
  bool notifications = true;
  int selectedVehicle = 0;
  final vehicles = <Map<String, String>>[
    {'name': 'Honda Civic', 'make': 'Honda', 'model': 'Civic', 'year': '2021', 'registration': 'LEA 2021 066', 'mileage': '42580', 'fuel': 'Petrol', 'type': 'Car'},
    {'name': 'Honda CG 125', 'make': 'Honda', 'model': 'CG 125', 'year': '2023', 'registration': 'SWL 2023 125', 'mileage': '8200', 'fuel': 'Petrol', 'type': 'Bike'},
  ];
  Map<String, String> get vehicle => vehicles[selectedVehicle];
  final reminders = <Map<String, String>>[
    {'title': 'Engine oil change', 'date': '2026/10/19', 'vehicle': 'Honda Civic', 'status': 'Upcoming'},
    {'title': 'Insurance renewal', 'date': '2026/10/10', 'vehicle': 'Honda Civic', 'status': 'Overdue'},
  ];
  final services = <Map<String, String>>[
    {'title': 'Oil and filter change', 'date': '2026/10/01', 'mileage': '42000', 'cost': '6500', 'workshop': 'Mustafa Auto Care', 'notes': 'Engine oil and oil filter replaced.'},
  ];
  int selectedService = 0;
  final expenses = <Map<String, String>>[
    {'title': 'Petrol', 'category': 'Fuel', 'amount': '8500', 'date': '2026/10/12'},
    {'title': 'Oil and filter', 'category': 'Maintenance', 'amount': '6500', 'date': '2026/10/01'},
    {'title': 'Car wash', 'category': 'Other', 'amount': '700', 'date': '2026/10/08'},
  ];
  final bookings = <Map<String, String>>[];
  final scans = <Map<String, String>>[];
  final reviews = <Map<String, String>>[];
  final documents = <Map<String, String>>[
    {'title': 'Registration certificate', 'expiry': 'No expiry'},
    {'title': 'Insurance policy', 'expiry': '2026/10/10'},
    {'title': 'Token tax receipt', 'expiry': '2027/06/30'},
  ];
  final workshops = <Map<String, String>>[
    {'name': 'Mustafa Auto Care', 'rating': '4.8', 'distance': '1.2 km', 'service': 'General service', 'address': 'College Road, Sahiwal'},
    {'name': 'City Tyre Centre', 'rating': '4.6', 'distance': '2.4 km', 'service': 'Tyres', 'address': 'High Street, Sahiwal'},
    {'name': 'Auto Electric Works', 'rating': '4.7', 'distance': '3.1 km', 'service': 'Electrical', 'address': 'Stadium Road, Sahiwal'},
  ];
  int selectedWorkshop = 0;
  Map<String, String> get workshop => workshops[selectedWorkshop];
  double get total => expenses.fold(0.0, (sum, e) => sum + (double.tryParse(e['amount'] ?? '') ?? 0));
  double categoryTotal(String category) => expenses.where((e) => e['category'] == category).fold(0.0, (sum, e) => sum + (double.tryParse(e['amount'] ?? '') ?? 0));
  void refresh() => notifyListeners();
}
