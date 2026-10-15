import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class BillScannerScreen extends StatelessWidget {
  const BillScannerScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Bill Scanner',  children: [

    const Heading('Clarity for every bill.', 'Scanner preview. This demo does not access the camera.'),
    Panel(dark: true, child: Column(children: [const SizedBox(height: 30), Icon(Icons.receipt_long, size: 130, color: ice), const SizedBox(height: 24), const Text('Place your receipt inside the frame', textAlign: TextAlign.center), const SizedBox(height: 40), const Icon(Icons.radio_button_checked, size: 54, color: Colors.white), const SizedBox(height: 20)])),
    ActionButton('Analyze sample bill', () { store.scans.insert(0, {'title': 'Workshop bill', 'type': 'Bill', 'route': '/bill_result'}); store.refresh(); go(context, '/bill_result'); }),
    const Text('Camera capture, image upload and AI analysis can be connected later.'),

  ]);
}
