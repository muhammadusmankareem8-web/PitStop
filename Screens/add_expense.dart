import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Add Expense',  children: [

    const Heading('Every expense, in view.', 'Record fuel, maintenance or another cost.'),
    DataForm(fields: const {'Title': '', 'Category': 'Fuel', 'Amount': '', 'Date': '', 'Litres': '', 'Mileage': '', 'Notes': ''}, choices: const {'Category': ['Fuel', 'Maintenance', 'Other']}, optional: const ['Litres', 'Mileage', 'Notes'], button: 'Save expense', onSave: (v) {
      if (double.parse(v['Amount']!) <= 0) { message(context, 'Amount must be greater than zero'); return; }
      store.expenses.add({'title': v['Title']!, 'category': v['Category']!, 'amount': v['Amount']!, 'date': v['Date']!, 'litres': v['Litres']!, 'mileage': v['Mileage']!, 'notes': v['Notes']!}); store.refresh(); Navigator.pop(context);
    }),

  ]);
}
