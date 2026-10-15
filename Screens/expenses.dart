import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Expenses',  children: [

    const Heading('Know where it goes.', 'All recorded expenses in this demo session.'),
    Panel(dark: true, child: Stat('Rs ${store.total.toStringAsFixed(0)}', 'Total recorded spending')),
    const SpendChart(),
    for (final e in store.expenses.reversed) MenuTile(e['title']!, "${e['category']} • ${e['date']} • Rs ${e['amount']}", e['category'] == 'Fuel' ? Icons.local_gas_station_outlined : Icons.receipt_outlined),
    ActionButton('Add expense', () => go(context, '/add_expense')),
    ActionButton('View reports', () => go(context, '/reports'), secondary: true),

  ]);
}
