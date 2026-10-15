import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class WarningScannerScreen extends StatelessWidget {
  const WarningScannerScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Warning Light Scanner',  children: [

    const Heading('What is that light?', 'Scanner preview. This demo does not access the camera.'),
    Panel(dark: true, child: Column(children: [const SizedBox(height: 30), Icon(Icons.warning_amber_rounded, size: 130, color: ice), const SizedBox(height: 24), const Text('Point at your dashboard warning light', textAlign: TextAlign.center), const SizedBox(height: 40), const Icon(Icons.radio_button_checked, size: 54, color: Colors.white), const SizedBox(height: 20)])),
    ActionButton('Analyze sample warning light', () { store.scans.insert(0, {'title': 'Check engine light', 'type': 'Warning', 'route': '/warning_result'}); store.refresh(); go(context, '/warning_result'); }),
    const Text('Camera capture, image upload and AI analysis can be connected later.'),

  ]);
}
