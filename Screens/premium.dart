import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}
class _PremiumScreenState extends State<PremiumScreen> {
  String plan = 'Monthly';
  @override
  Widget build(BuildContext context) => PageShell(title: 'PitStop Premium', children: [
    const Heading('More room for the road.', 'Illustrative plans. No subscription is sold by this demo.'),
    FilterBar(const ['Monthly', 'Yearly'], plan, (v) => setState(() => plan = v)),
    Panel(dark: true, child: Column(children: [const Icon(Icons.workspace_premium, color: ice, size: 64), const SizedBox(height: 20), Stat(plan == 'Monthly' ? 'Rs 499' : 'Rs 4,999', plan == 'Monthly' ? 'Per month • sample price' : 'Per year • sample price')])),
    const MenuTile('More vehicles', 'Manage your entire garage', Icons.directions_car_outlined),
    const MenuTile('More insights', 'Detailed reports and scan history', Icons.insights),
    const MenuTile('Priority assistance', 'Extra help with your vehicle records', Icons.support_agent),
    ActionButton('Preview checkout', () => showDialog<void>(context: context, builder: (ctx) => AlertDialog(title: const Text('Demo checkout'), content: Text('$plan plan selected.\nNo payment details are collected and no charge will be made.'), actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))]))),
  ]);
}
