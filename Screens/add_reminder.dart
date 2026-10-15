import 'package:flutter/material.dart';
import '../widgets/app_ui.dart';
class AddReminderScreen extends StatelessWidget {
  const AddReminderScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Add Reminder',  children: [

    const Heading('Never miss a service.', 'Set a date and keep your vehicle in shape.'),
    DataForm(fields: {'Vehicle': store.vehicle['name']!, 'Task': '', 'Date': '', 'Mileage limit': '', 'Notify': '1 day before'}, choices: {'Vehicle': store.vehicles.map((v) => v['name']!).toList(), 'Notify': ['On the day', '1 day before', '3 days before']}, optional: const ['Mileage limit'], button: 'Save reminder', onSave: (v) {
      final due = DateTime.parse(v['Date']!.replaceAll('/', '-')); final now = DateTime.now();
      store.reminders.add({'title': v['Task']!, 'vehicle': v['Vehicle']!, 'date': v['Date']!, 'status': due.isBefore(DateTime(now.year, now.month, now.day)) ? 'Overdue' : 'Upcoming', 'mileage': v['Mileage limit']!, 'notify': v['Notify']!}); store.refresh(); Navigator.pop(context);
    }), const Text('Reminders are stored for this session. Device notifications are not scheduled.'),

  ]);
}
