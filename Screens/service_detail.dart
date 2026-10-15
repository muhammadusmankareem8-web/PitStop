import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    if (store.services.isEmpty) return const PageShell(title: 'Service Detail', children: [Panel(child: Text('No service records. Add one from Service History.'))]);
    final index = store.selectedService.clamp(0, store.services.length - 1).toInt();
    final record = store.services[index];
    return PageShell(title: 'Service Detail',  children: [

      Heading(record['title']!, record['date']!),
      Panel(dark: true, child: Stat('Rs ${record['cost']}', 'Total service cost')),
      MenuTile('Workshop', record['workshop']!, Icons.storefront),
      MenuTile('Mileage', '${record['mileage']} km', Icons.speed),
      Panel(child: Text(record['notes']!)),
      ActionButton('Delete record', () async {
        final confirmed = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(title: const Text('Delete this service?'), content: const Text('This removes the record from the current demo session.'), actions: [TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Keep')), TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete'))]));
        if (confirmed == true && context.mounted) { store.services.remove(record); Navigator.pop(context); store.refresh(); }
      }, secondary: true),

    ]);
  }
}
