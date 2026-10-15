import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});
  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}
class _BookingsScreenState extends State<BookingsScreen> {
  String filter = 'Upcoming';
  @override
  Widget build(BuildContext context) => PageShell(title: 'My Bookings', children: [
    const Heading('Your next pit stops.', 'Manage appointments in this demo session.'),
    FilterBar(const ['Upcoming', 'Completed', 'Cancelled'], filter, (v) => setState(() => filter = v)),
    if (!store.bookings.any((b) => b['status'] == filter)) const Panel(child: Text('No bookings in this category.')),
    for (final b in store.bookings.where((b) => b['status'] == filter)) Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(b['workshop']!, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700)), const SizedBox(height: 8), Text('${b['vehicle']} • ${b['service']}'), Text('${b['date']} at ${b['time']}'), const SizedBox(height: 16),
      if (filter == 'Upcoming') ...[
        ActionButton('Mark completed for demo', () { b['status'] = 'Completed'; store.refresh(); setState(() {}); }),
        ActionButton('Reschedule', () async { final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2100)); if (date != null && mounted) { b['date'] = '${date.year}/${date.month}/${date.day}'; store.refresh(); setState(() {}); } }, secondary: true),
        ActionButton('Cancel booking', () { b['status'] = 'Cancelled'; store.refresh(); setState(() {}); }, secondary: true),
      ],
      if (filter == 'Completed') ActionButton('Write a review', () { store.selectedWorkshop = store.workshops.indexWhere((w) => w['name'] == b['workshop']); go(context, '/write_review'); }),
    ])),
    ActionButton('Find a workshop', () => go(context, '/mechanic_list')),
  ]);
}
