import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Book Appointment',  children: [

    Heading('Make time for your vehicle.', store.workshop['name']!),
    DataForm(fields: {'Vehicle': store.vehicle['name']!, 'Service': 'General service', 'Date': '', 'Time': '10:00 AM', 'Notes': ''}, choices: {'Vehicle': store.vehicles.map((v) => v['name']!).toList(), 'Service': ['General service', 'Oil change', 'Tyres', 'Electrical'], 'Time': ['10:00 AM', '11:30 AM', '2:00 PM', '4:00 PM']}, optional: const ['Notes'], button: 'Review booking', onSave: (v) async {
      final due = DateTime.parse(v['Date']!.replaceAll('/', '-')); final now = DateTime.now();
      if (due.isBefore(DateTime(now.year, now.month, now.day))) { message(context, 'Choose today or a future date'); return; }
      final confirmed = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(title: const Text('Confirm demo booking'), content: Text('${store.workshop['name']}\n${v['Vehicle']}\n${v['Service']}\n${v['Date']} at ${v['Time']}\n\nNo request will be sent to a workshop.'), actions: [TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Back')), FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Confirm'))]));
      if (confirmed == true && context.mounted) { store.bookings.add({'workshop': store.workshop['name']!, 'vehicle': v['Vehicle']!, 'service': v['Service']!, 'date': v['Date']!, 'time': v['Time']!, 'status': 'Upcoming'}); store.refresh(); Navigator.pushReplacementNamed(context, '/bookings'); }
    }),

  ]);
}
