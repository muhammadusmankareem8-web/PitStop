import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Reports & Charts',  children: [

    const Heading('The bigger picture.', 'Totals calculated from your session expense records.'),
    Panel(dark: true, child: Stat('Rs ${store.total.toStringAsFixed(0)}', 'Total expenses')),
    const SpendChart(),
    for (final category in ['Fuel', 'Maintenance', 'Other']) MenuTile(category, 'Rs ${store.categoryTotal(category).toStringAsFixed(0)}', Icons.bar_chart),
    Panel(child: Stat('${store.expenses.length}', 'Transactions recorded')),
    const Panel(child: Text('Add fuel litres and mileage to your expense records. Fuel efficiency needs consistent full tank readings and is not calculated in this demo.')),

  ]);
}
