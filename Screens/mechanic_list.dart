import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class MechanicListScreen extends StatefulWidget {
  const MechanicListScreen({super.key});
  @override
  State<MechanicListScreen> createState() => _MechanicListScreenState();
}
class _MechanicListScreenState extends State<MechanicListScreen> {
  String filter = 'All';
  String search = '';
  @override
  Widget build(BuildContext context) => PageShell(title: 'Nearby Workshops', children: [
    const Heading('Find your trusted pit stop.', 'Sample workshops in Sahiwal'),
    TextField(decoration: const InputDecoration(hintText: 'Search workshops', prefixIcon: Icon(Icons.search)), onChanged: (v) => setState(() => search = v.toLowerCase())), const SizedBox(height: 18),
    FilterBar(const ['All', 'General service', 'Tyres', 'Electrical'], filter, (v) => setState(() => filter = v)),
    for (var i = 0; i < store.workshops.length; i++)
      if ((filter == 'All' || store.workshops[i]['service'] == filter) && store.workshops[i]['name']!.toLowerCase().contains(search))
        MenuTile(store.workshops[i]['name']!, "${store.workshops[i]['rating']} stars • ${store.workshops[i]['distance']}\n${store.workshops[i]['service']}", Icons.storefront, onTap: () { store.selectedWorkshop = i; go(context, '/workshop_profile'); }),
    if (!store.workshops.any((w) => (filter == 'All' || w['service'] == filter) && w['name']!.toLowerCase().contains(search))) const Panel(child: Text('No matching workshops. Try another filter.')),
  ]);
}
