import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'My Garage', tab: 1, children: [

    const Heading('Your garage.', 'A place for every journey.'),
    for (var i = 0; i < store.vehicles.length; i++) ...[
      VehicleHero(store.vehicles[i]),
      ActionButton('Open ${store.vehicles[i]['name']}', () { store.selectedVehicle = i; store.refresh(); go(context, '/vehicle_overview'); }, secondary: true),
    ],
    ActionButton('Add vehicle', () => go(context, '/add_vehicle')),

  ]);
}
