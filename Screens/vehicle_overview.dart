import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class VehicleOverviewScreen extends StatelessWidget {
  const VehicleOverviewScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Vehicle Overview',  children: [

    VehicleHero(store.vehicle),
    Panel(dark: true, child: Stat('${store.vehicle['mileage']} km', 'Recorded mileage')),
    MenuTile('Edit vehicle', 'Update your vehicle details', Icons.edit_outlined, onTap: () => go(context, '/edit_vehicle')),
    MenuTile('Service history', 'Maintenance and repairs', Icons.build_outlined, onTap: () => go(context, '/service_history')),
    MenuTile('Documents vault', 'Registration, insurance and tax', Icons.folder_outlined, onTap: () => go(context, '/documents')),
    MenuTile('Resale estimate', 'Try the sample estimator', Icons.sell_outlined, onTap: () => go(context, '/resale')),
    ActionButton('Add service record', () => go(context, '/add_service')),

  ]);
}
