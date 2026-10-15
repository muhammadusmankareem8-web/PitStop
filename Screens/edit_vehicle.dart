import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class EditVehicleScreen extends StatelessWidget {
  const EditVehicleScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Edit Vehicle',  children: [

    const Heading('Update your vehicle.', 'Enter the details of your car or bike.'),
    DataForm(fields: {'Type': store.vehicle["type"]!, 'Make': store.vehicle["make"]!, 'Model': store.vehicle["model"]!, 'Year': store.vehicle["year"]!, 'Registration': store.vehicle["registration"]!, 'Mileage': store.vehicle["mileage"]!, 'Fuel': store.vehicle["fuel"]!}, choices: const {'Type': ['Car', 'Bike'], 'Fuel': ['Petrol', 'Diesel', 'Electric', 'Hybrid']}, button: 'Save vehicle', onSave: (v) {
      final vehicle = {'name': "${v['Make']} ${v['Model']}", 'type': v['Type']!, 'make': v['Make']!, 'model': v['Model']!, 'year': v['Year']!, 'registration': v['Registration']!, 'mileage': v['Mileage']!, 'fuel': v['Fuel']!};
      store.vehicles[store.selectedVehicle] = vehicle;
      store.refresh(); Navigator.pop(context);
    }),

  ]);
}
