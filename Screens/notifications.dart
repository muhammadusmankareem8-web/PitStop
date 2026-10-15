import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}
class _NotificationsScreenState extends State<NotificationsScreen> {
  final read = <int>{};
  final alerts = const [
    ['Service reminder', 'Review your upcoming maintenance.', '/reminders'],
    ['Documents need attention', 'Check your insurance expiry date.', '/documents'],
    ['Plan your next visit', 'Manage your workshop appointments.', '/bookings'],
  ];
  @override
  Widget build(BuildContext context) => PageShell(title: 'Notifications', children: [
    const Heading('You are in the loop.', 'Sample notifications for your garage.'),
    ActionButton('Mark all as read', () => setState(() => read.addAll([0, 1, 2])), secondary: true),
    for (var i = 0; i < alerts.length; i++) MenuTile(alerts[i][0], '${read.contains(i) ? 'Read' : 'Unread'} • ${alerts[i][1]}', read.contains(i) ? Icons.drafts_outlined : Icons.mark_email_unread_outlined, onTap: () { setState(() => read.add(i)); go(context, alerts[i][2]); }),
  ]);
}
