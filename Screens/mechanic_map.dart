import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class MechanicMapScreen extends StatelessWidget {
  const MechanicMapScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Mechanic Finder', children: [
    const Heading('Good hands, nearby.', 'Sahiwal • illustrated map with sample workshops'),
    ClipRRect(borderRadius: BorderRadius.circular(24), child: SizedBox(height: 300, child: Stack(children: [
      const Positioned.fill(child: CustomPaint(painter: _MapPainter())),
      for (var i = 0; i < 3; i++) Positioned(left: [45.0, 155.0, 95.0][i], top: [55.0, 145.0, 215.0][i], child: IconButton.filled(tooltip: store.workshops[i]['name'], onPressed: () { store.selectedWorkshop = i; go(context, '/workshop_profile'); }, icon: const Icon(Icons.location_on))),
      const Positioned(right: 12, bottom: 12, child: Chip(label: Text('Sample map'))),
    ]))),
    const SizedBox(height: 22),
    for (var i = 0; i < store.workshops.length; i++) MenuTile(store.workshops[i]['name']!, "${store.workshops[i]['rating']} stars • ${store.workshops[i]['distance']}", Icons.build_outlined, onTap: () { store.selectedWorkshop = i; go(context, '/workshop_profile'); }),
    ActionButton('View list and filters', () => go(context, '/mechanic_list')),
  ]);
}
class _MapPainter extends CustomPainter {
  const _MapPainter();
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = const Color(0xFFE4F0EB));
    final river = Path()..moveTo(size.width * .8, 0)..cubicTo(size.width * .3, 100, size.width, 170, size.width * .45, size.height);
    canvas.drawPath(river, Paint()..color = ice..style = PaintingStyle.stroke..strokeWidth = 36);
    final roads = Paint()..color = Colors.white..strokeWidth = 16;
    for (var i = 1; i < 5; i++) { canvas.drawLine(Offset(0, i * 65), Offset(size.width, i * 45), roads); }
    canvas.drawLine(Offset(size.width * .3, 0), Offset(size.width * .6, size.height), roads);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
