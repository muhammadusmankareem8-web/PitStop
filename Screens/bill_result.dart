import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class BillResultScreen extends StatefulWidget {
  const BillResultScreen({super.key});
  @override
  State<BillResultScreen> createState() => _BillResultScreenState();
}
class _BillResultScreenState extends State<BillResultScreen> {
  bool saved = false;
  @override
  Widget build(BuildContext context) => PageShell(title: 'Bill Analysis', children: [
    const Heading('Your bill, explained.', 'Sample values only. No real price comparison has been performed.'),
    const Panel(dark: true, child: Stat('Rs 6,500', 'Sample bill total')),
    const MenuTile('Engine oil', 'Rs 4,000 • Sample reference Rs 3,500 to 4,500', Icons.check_circle_outline),
    const MenuTile('Oil filter', 'Rs 1,500 • Sample reference Rs 800 to 1,200', Icons.flag_outlined),
    const MenuTile('Labour', 'Rs 1,000 • Sample reference Rs 800 to 1,500', Icons.check_circle_outline),
    const Panel(child: Text('Oil filter is above the illustrative range. Actual prices depend on vehicle, brand and location.')),
    ActionButton(saved ? 'Saved to expenses' : 'Save sample bill as expense', () { if (saved) return; store.expenses.add({'title': 'Sample scanned bill', 'category': 'Maintenance', 'amount': '6500', 'date': DateTime.now().toString().split(' ').first}); store.refresh(); setState(() => saved = true); }),
    ActionButton('View expenses', () => go(context, '/expenses'), secondary: true),
  ]);
}
