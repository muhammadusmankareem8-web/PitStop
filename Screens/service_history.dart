import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class ServiceHistoryScreen extends StatelessWidget {
  const ServiceHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Service History',  children: [

    const Heading('A well kept history.', 'Every service. Every small improvement.'),
    if (store.services.isEmpty) const Panel(child: Text('No service records yet.')),
    for (var i = 0; i < store.services.length; i++) MenuTile(store.services[i]['title']!, "${store.services[i]['date']} • Rs ${store.services[i]['cost']}", Icons.build_circle_outlined, onTap: () { store.selectedService = i; go(context, '/service_detail'); }),
    ActionButton('Add service record', () => go(context, '/add_service')),

  ]);
}
