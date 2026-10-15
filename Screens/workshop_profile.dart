import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class WorkshopProfileScreen extends StatelessWidget {
  const WorkshopProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Workshop Profile',  children: [

    const Panel(dark: true, child: Padding(padding: EdgeInsets.all(28), child: Icon(Icons.handyman_outlined, size: 80, color: ice))),
    Heading(store.workshop['name']!, '${store.workshop['rating']} stars • ${store.workshop['distance']} away • Sample listing'),
    MenuTile('Address', store.workshop['address']!, Icons.location_on_outlined),
    const MenuTile('Opening hours', 'Monday to Saturday • 9:00 AM to 7:00 PM', Icons.schedule),
    MenuTile('Services', store.workshop['service']!, Icons.build_outlined),
    const Panel(child: Text('Sample review: Friendly staff and clear explanations of the work needed.')),
    for (final r in store.reviews.where((r) => r['workshop'] == store.workshop['name'])) MenuTile('${r['rating']} stars', r['feedback']!, Icons.star_outline),
    ActionButton('Book appointment', () => go(context, '/book_appointment')),

  ]);
}
