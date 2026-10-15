import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class ScanHistoryScreen extends StatefulWidget {
  const ScanHistoryScreen({super.key});
  @override
  State<ScanHistoryScreen> createState() => _ScanHistoryScreenState();
}
class _ScanHistoryScreenState extends State<ScanHistoryScreen> {
  String filter = 'All';
  @override
  Widget build(BuildContext context) => PageShell(title: 'Scan History', tab: 2, children: [
    const Heading('A little clarity, saved.', 'Your sample scans appear here.'),
    FilterBar(const ['All', 'Warning', 'Bill'], filter, (v) => setState(() => filter = v)),
    if (store.scans.where((s) => filter == 'All' || s['type'] == filter).isEmpty) const Panel(child: Text('No scans yet. Try one of the sample scanners.')),
    for (final s in store.scans.where((s) => filter == 'All' || s['type'] == filter)) MenuTile(s['title']!, '${s['type']} • Demo', Icons.document_scanner, onTap: () => go(context, s['route']!)),
    ActionButton('Scan warning light', () => go(context, '/warning_scanner')),
    ActionButton('Scan a bill', () => go(context, '/bill_scanner'), secondary: true),
  ]);
}
