import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'PitStop.', tab: 0, children: [

    Heading('Hello, ${store.name.split(' ').first}.', 'A little care. A better journey.'),
    VehicleHero(store.vehicle),
    Panel(dark: true, child: Row(children: [Expanded(child: Stat('${store.vehicle['mileage']} km', 'Odometer')), const Expanded(child: Stat('14 Oct', 'Next service • demo'))])),
    const Heading('Quick tools', 'Everything your vehicle needs.'),
    MenuTile('Warning light', 'Understand your dashboard', Icons.warning_amber, onTap: () => go(context, '/warning_scanner')),
    MenuTile('Scan a bill', 'Take a closer look at your costs', Icons.receipt_long, onTap: () => go(context, '/bill_scanner')),
    MenuTile('Reminders', '${store.reminders.length} saved reminders', Icons.calendar_month, onTap: () => go(context, '/reminders')),
    ActionButton('Find a mechanic', () => go(context, '/mechanic_map')),
    MenuTile('Expenses', 'Rs ${store.total.toStringAsFixed(0)} recorded', Icons.account_balance_wallet_outlined, onTap: () => go(context, '/expenses')),
    MenuTile('Notifications', 'Your latest updates', Icons.notifications_outlined, onTap: () => go(context, '/notifications')),
    MenuTile('Ask PitStop', 'Demo assistant', Icons.chat_bubble_outline, onTap: () => go(context, '/ai_chat')),

  ]);
}
