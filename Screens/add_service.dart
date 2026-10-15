import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Add Service Record',  children: [

    const Heading('Record the care.', 'Keep a simple record of completed work.'),
    DataForm(fields: {'Service': '', 'Date': '', 'Mileage': store.vehicle['mileage']!, 'Cost': '', 'Workshop': '', 'Notes': ''}, optional: const ['Notes'], button: 'Save service', onSave: (v) {
      store.services.add({'title': v['Service']!, 'date': v['Date']!, 'mileage': v['Mileage']!, 'cost': v['Cost']!, 'workshop': v['Workshop']!, 'notes': v['Notes']!}); store.refresh(); Navigator.pop(context);
    }),

  ]);
}
