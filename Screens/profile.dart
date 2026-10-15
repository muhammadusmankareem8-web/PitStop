import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Profile', tab: 3, children: [

    const Center(child: CircleAvatar(radius: 42, backgroundColor: ice, foregroundColor: navy, child: Icon(Icons.person_outline, size: 48))),
    const SizedBox(height: 20),
    Heading(store.name, store.email),
    DataForm(fields: {'Name': store.name, 'Email': store.email}, button: 'Update profile', onSave: (v) { store.name = v['Name']!; store.email = v['Email']!; store.refresh(); message(context, 'Profile updated'); }),
    MenuTile('My bookings', 'Upcoming and completed appointments', Icons.calendar_month_outlined, onTap: () => go(context, '/bookings')),
    MenuTile('Documents', 'Your vehicle paperwork', Icons.folder_outlined, onTap: () => go(context, '/documents')),
    MenuTile('Expenses', 'Review your spending', Icons.wallet_outlined, onTap: () => go(context, '/expenses')),
    MenuTile('PitStop Premium', 'Explore the demo plans', Icons.workspace_premium_outlined, onTap: () => go(context, '/premium')),
    MenuTile('Settings', 'Appearance and preferences', Icons.settings_outlined, onTap: () => go(context, '/settings')),

  ]);
}
