import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Documents Vault',  children: [

    const Heading('Your documents, sorted.', 'Sample document cards. File uploads require a storage integration.'),
    for (final doc in store.documents) MenuTile(doc['title']!, doc['expiry']!, Icons.description_outlined, onTap: () => showDialog<void>(context: context, builder: (ctx) => AlertDialog(title: Text(doc['title']!), content: Text('Sample document record.\nExpiry: ${doc['expiry']}\nNo file is attached to this demo.'), actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))]))),
    ActionButton('Add sample document', () { store.documents.add({'title': 'Vehicle document ${store.documents.length + 1}', 'expiry': 'No expiry'}); store.refresh(); message(context, 'Sample document record added'); }),

  ]);
}
