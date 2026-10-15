import 'package:flutter/material.dart';
import '../data/demo_store.dart';
export '../data/demo_store.dart';

const navy = Color(0xFF0B2D50);
const ice = Color(0xFFBCE8F7);
const paper = Color(0xFFF3F9FC);
final store = DemoStore.instance;
void go(BuildContext context, String route) => Navigator.pushNamed(context, route);
void home(BuildContext context) => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
void message(BuildContext context, String text) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

class PageShell extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final int? tab;
  const PageShell({super.key, required this.title, required this.children, this.tab});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title), actions: [IconButton(tooltip: 'All screens', onPressed: () => go(context, '/directory'), icon: const Icon(Icons.grid_view_rounded))]),
    bottomNavigationBar: tab == null ? null : NavigationBar(
      selectedIndex: tab!,
      onDestinationSelected: (index) {
        if (index != tab) Navigator.pushReplacementNamed(context, ['/home', '/garage', '/scan_history', '/profile'][index]);
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.directions_car_outlined), label: 'Garage'),
        NavigationDestination(icon: Icon(Icons.document_scanner_outlined), label: 'Scans'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    ),
    body: SafeArea(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 600), child: ListView(padding: const EdgeInsets.all(22), children: children)))),
  );
}

class Heading extends StatelessWidget {
  final String title, subtitle;
  const Heading(this.title, this.subtitle, {super.key});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 24), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)), const SizedBox(height: 8), Text(subtitle, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, height: 1.5))]));
}

class Panel extends StatelessWidget {
  final Widget child;
  final bool dark;
  const Panel({super.key, required this.child, this.dark = false});
  @override
  Widget build(BuildContext context) => Container(width: double.infinity, margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: dark ? navy : Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(22), border: Border.all(color: dark ? navy : const Color(0xFFD5E5EC))), child: DefaultTextStyle.merge(style: TextStyle(color: dark ? Colors.white : Theme.of(context).colorScheme.onSurface), child: child));
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool secondary;
  const ActionButton(this.label, this.onPressed, {super.key, this.secondary = false});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 12), child: SizedBox(width: double.infinity, child: secondary ? OutlinedButton(onPressed: onPressed, child: Text(label)) : FilledButton(onPressed: onPressed, child: Text(label))));
}

class MenuTile extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  const MenuTile(this.title, this.subtitle, this.icon, {super.key, this.onTap});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 12), child: Material(color: Theme.of(context).colorScheme.surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFFD5E5EC))), child: ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), leading: CircleAvatar(backgroundColor: ice, foregroundColor: navy, child: Icon(icon)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), subtitle: Text(subtitle), trailing: onTap == null ? null : const Icon(Icons.chevron_right), onTap: onTap)));
}

class Stat extends StatelessWidget {
  final String value, label;
  const Stat(this.value, this.label, {super.key});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)), const SizedBox(height: 8), Text(label)]);
}

class VehicleHero extends StatelessWidget {
  final Map<String, String> vehicle;
  const VehicleHero(this.vehicle, {super.key});
  @override
  Widget build(BuildContext context) => Panel(child: Column(children: [const Text('YOUR GARAGE', style: TextStyle(letterSpacing: 3, fontSize: 11)), const SizedBox(height: 12), Text(vehicle['name']!, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)), Text("${vehicle['year']} • ${vehicle['fuel']}"), const SizedBox(height: 12), Icon(vehicle['type'] == 'Bike' ? Icons.two_wheeler : Icons.directions_car_filled, size: 130, color: navy), Text(vehicle['registration']!)]));
}

// Reusable validated form. Each screen supplies its own fields and save action.
class DataForm extends StatefulWidget {
  final Map<String, String> fields;
  final Map<String, List<String>> choices;
  final List<String> optional;
  final String button;
  final void Function(Map<String, String>) onSave;
  const DataForm({super.key, required this.fields, required this.onSave, this.choices = const {}, this.optional = const [], this.button = 'Save'});
  @override
  State<DataForm> createState() => _DataFormState();
}
class _DataFormState extends State<DataForm> {
  final keyForm = GlobalKey<FormState>();
  late Map<String, TextEditingController> controls;
  @override
  void initState() { super.initState(); controls = widget.fields.map((key, value) => MapEntry(key, TextEditingController(text: value))); }
  @override
  void dispose() { for (final c in controls.values) { c.dispose(); } super.dispose(); }
  bool numeric(String label) => ['Amount', 'Cost', 'Mileage', 'Year', 'Litres', 'Mileage limit', 'Current value'].contains(label);
  @override
  Widget build(BuildContext context) => Form(key: keyForm, child: Column(children: [
    for (final entry in controls.entries) Padding(padding: const EdgeInsets.only(bottom: 16), child:
    widget.choices.containsKey(entry.key) ? DropdownButtonFormField<String>(
      value: entry.value.text.isEmpty ? null : entry.value.text,
      decoration: InputDecoration(labelText: entry.key),
      items: widget.choices[entry.key]!.toSet().map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
      onChanged: (v) => entry.value.text = v ?? '', validator: (v) => v == null ? 'Please select an option' : null,
    ) : TextFormField(
      controller: entry.value, obscureText: entry.key.contains('Password'),
      readOnly: entry.key == 'Date',
      onTap: entry.key != 'Date' ? null : () async {
        final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
        if (date != null) entry.value.text = '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
      },
      keyboardType: numeric(entry.key) ? const TextInputType.numberWithOptions(decimal: true) : entry.key == 'Email' ? TextInputType.emailAddress : TextInputType.text,
      maxLines: ['Notes', 'Feedback'].contains(entry.key) ? 3 : 1,
      decoration: InputDecoration(labelText: entry.key, suffixIcon: entry.key == 'Date' ? const Icon(Icons.calendar_month) : null),
      validator: (value) {
        final v = value?.trim() ?? '';
        if (v.isEmpty) return widget.optional.contains(entry.key) ? null : 'Enter ${entry.key.toLowerCase()}';
        if (entry.key == 'Email' && !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v)) return 'Enter a valid email';
        if (entry.key.contains('Password') && v.length < 6) return 'Use at least 6 characters';
        if (numeric(entry.key) && (double.tryParse(v) == null || !double.parse(v).isFinite || double.parse(v) < 0)) return 'Enter a valid positive number';
        if (entry.key == 'Year' && (int.tryParse(v) == null || int.parse(v) < 1900 || int.parse(v) > DateTime.now().year + 1)) return 'Enter a valid year';
        return null;
      },
    )),
    ActionButton(widget.button, () { if (keyForm.currentState!.validate()) widget.onSave(controls.map((k, v) => MapEntry(k, v.text.trim()))); }),
  ]));
}

class FilterBar extends StatelessWidget {
  final List<String> options;
  final String selected;
  final ValueChanged<String> onChanged;
  const FilterBar(this.options, this.selected, this.onChanged, {super.key});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 20), child: Wrap(spacing: 8, children: options.map((s) => ChoiceChip(label: Text(s), selected: selected == s, onSelected: (_) => onChanged(s))).toList()));
}

class SpendChart extends StatelessWidget {
  const SpendChart({super.key});
  @override
  Widget build(BuildContext context) {
    final labels = ['Fuel', 'Maintenance', 'Other'];
    final values = labels.map(store.categoryTotal).toList();
    final maximum = values.fold(1.0, (a, b) => a > b ? a : b);
    return Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Spending by category', style: TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 20), for (var i = 0; i < labels.length; i++) Padding(padding: const EdgeInsets.only(bottom: 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('${labels[i]} • Rs ${values[i].toStringAsFixed(0)}'), const SizedBox(height: 8), LinearProgressIndicator(value: values[i] / maximum, minHeight: 12, backgroundColor: ice, color: navy)]))]));
  }
}
