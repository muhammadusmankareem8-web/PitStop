import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class WarningResultScreen extends StatelessWidget {
  const WarningResultScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Warning Light Result',  children: [

    const Heading('Check engine light', 'Sample result • not an actual diagnosis'),
    const Panel(child: Column(children: [Icon(Icons.warning_amber_rounded, size: 86, color: Colors.orange), SizedBox(height: 12), Text('Needs attention', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 12), Text('A check engine light can indicate an engine or emissions issue. A diagnostic check is needed to identify the cause.') ])),
    const MenuTile('What to do', 'Check the vehicle manual. If the light flashes or the vehicle runs poorly, stop safely and seek assistance.', Icons.info_outline),
    ActionButton('Find a mechanic', () => go(context, '/mechanic_map')),
    ActionButton('Ask the demo assistant', () => go(context, '/ai_chat'), secondary: true),

  ]);
}
