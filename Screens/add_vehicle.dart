import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Add Vehicle',  children: [

    const Heading('Meet your next journey.', 'Enter the details of your car or bike.'),
    DataForm(fields: {'Type': 'Car', 'Make': '', 'Model': '', 'Year': '2021', 'Registration': '', 'Mileage': '0', 'Fuel': 'Petrol'}, choices: const {'Type': ['Car', 'Bike'], 'Fuel': ['Petrol', 'Diesel', 'Electric', 'Hybrid']}, button: 'Save vehicle', onSave: (v) {
      final vehicle = {'name': "${v['Make']} ${v['Model']}", 'type': v['Type']!, 'make': v['Make']!, 'model': v['Model']!, 'year': v['Year']!, 'registration': v['Registration']!, 'mileage': v['Mileage']!, 'fuel': v['Fuel']!};
      store.vehicles.add(vehicle); store.selectedVehicle = store.vehicles.length - 1;
      store.refresh(); Navigator.pop(context);
    }),

  ]);
}
