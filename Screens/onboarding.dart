import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int page = 0;
  final titles = ['Your garage. Always with you.', 'Less guessing. More understanding.', 'Stay ahead of the road.'];
  final subtitles = ['Keep your cars, bikes and documents together in one place.', 'Explore warning lights and understand your workshop bills.', 'Track services, expenses and every important reminder.'];
  final icons = [Icons.directions_car, Icons.document_scanner_outlined, Icons.calendar_month];
  @override
  void dispose() { controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('PitStop.'), actions: [TextButton(onPressed: () => Navigator.pushReplacementNamed(context, '/login'), child: const Text('Skip'))]), body: SafeArea(child: Column(children: [Expanded(child: PageView.builder(controller: controller, itemCount: 3, onPageChanged: (i) => setState(() => page = i), itemBuilder: (context, i) => SingleChildScrollView(padding: const EdgeInsets.all(28), child: Column(children: [const SizedBox(height: 40), Container(height: 230, width: double.infinity, decoration: BoxDecoration(color: ice, borderRadius: BorderRadius.circular(30)), child: Icon(icons[i], size: 110, color: navy)), const SizedBox(height: 38), Heading(titles[i], subtitles[i])])))), Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(3, (i) => Container(margin: const EdgeInsets.all(5), width: i == page ? 28 : 8, height: 8, decoration: BoxDecoration(color: i == page ? navy : ice, borderRadius: BorderRadius.circular(8))))), Padding(padding: const EdgeInsets.all(24), child: ActionButton(page == 2 ? 'Get started' : 'Next', () { if (page == 2) { Navigator.pushReplacementNamed(context, '/login'); } else { controller.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeInOut); } }))])));
}
