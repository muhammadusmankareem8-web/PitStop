import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class ResaleScreen extends StatefulWidget {
  const ResaleScreen({super.key});
  @override
  State<ResaleScreen> createState() => _ResaleScreenState();
}
class _ResaleScreenState extends State<ResaleScreen> {
  double? estimate;
  @override
  Widget build(BuildContext context) => PageShell(title: 'Resale Estimator', children: [
    const Heading('What is your vehicle worth?', 'Illustrative calculator only. This is not a market valuation.'),
    DataForm(fields: {'Current value': '5000000', 'Year': store.vehicle['year']!, 'Mileage': store.vehicle['mileage']!, 'Condition': 'Good'}, choices: const {'Condition': ['Excellent', 'Good', 'Fair']}, button: 'Calculate demo range', onSave: (v) {
      final age = (DateTime.now().year - int.parse(v['Year']!)).clamp(0, 50);
      final factor = v['Condition'] == 'Excellent' ? 1.0 : v['Condition'] == 'Good' ? .9 : .75;
      final mileageFactor = (1 - double.parse(v['Mileage']!) / 1000000).clamp(.6, 1.0);
      setState(() => estimate = double.parse(v['Current value']!) * (1 - age * .05).clamp(.2, 1.0) * factor * mileageFactor);
    }),
    if (estimate != null) Panel(dark: true, child: Stat('Rs ${(estimate! * .95).round()} to ${(estimate! * 1.05).round()}', 'Illustrative range')),
    const Text('Formula: input value × age factor × condition factor × mileage factor. A real estimator needs verified market data.'),
  ]);
}
