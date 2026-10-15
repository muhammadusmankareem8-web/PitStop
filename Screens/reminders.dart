import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});
  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}
class _RemindersScreenState extends State<RemindersScreen> {
  String filter = 'Upcoming';
  @override
  Widget build(BuildContext context) => PageShell(title: 'Reminders', children: [
    const Heading('Stay one step ahead.', 'A little reminder goes a long way.'),
    FilterBar(const ['Upcoming', 'Overdue', 'Completed'], filter, (v) => setState(() => filter = v)),
    if (!store.reminders.any((r) => r['status'] == filter)) const Panel(child: Text('No reminders in this category.')),
    for (final r in store.reminders.where((r) => r['status'] == filter)) MenuTile(r['title']!, "${r['vehicle']} • ${r['date']}", Icons.event_available, onTap: () { r['status'] = r['status'] == 'Completed' ? 'Upcoming' : 'Completed'; store.refresh(); setState(() {}); }),
    const Text('Tap a reminder to change its completion status.'), const SizedBox(height: 18),
    ActionButton('Add reminder', () => go(context, '/add_reminder')),
  ]);
}
