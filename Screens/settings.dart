import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => PageShell(title: 'Settings', children: [
    const Heading('Make it yours.', 'A few simple preferences for your journey.'),
    Panel(child: Column(children: [
      SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Dark theme'), value: store.dark, onChanged: (v) { store.dark = v; store.refresh(); }),
      SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Demo notifications'), subtitle: const Text('Preference only. No push service is connected.'), value: store.notifications, onChanged: (v) { store.notifications = v; store.refresh(); }),
    ])),
    const MenuTile('Language', 'English • additional translations can be added later', Icons.language),
    MenuTile('About PitStop', 'Version 1.0.0 • Student frontend demo', Icons.info_outline, onTap: () => showAboutDialog(context: context, applicationName: 'PitStop', applicationVersion: '1.0.0', children: const [Text('Vehicle management frontend for the MAD assignment. Data stays in memory for this session.')])),
    MenuTile('Help', 'How to use this demo', Icons.help_outline, onTap: () => showDialog<void>(context: context, builder: (ctx) => AlertDialog(title: const Text('Explore PitStop'), content: const Text('Use the grid icon to open any screen. Add vehicles, expenses, reminders and demo bookings. Restarting the app resets the sample data.'), actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))]))),
    const Panel(child: Text('Privacy: this version has no backend, analytics, camera capture or payment connection. Entries remain in app memory.')),
    ActionButton('Log out of demo', () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false), secondary: true),
  ]);
}
