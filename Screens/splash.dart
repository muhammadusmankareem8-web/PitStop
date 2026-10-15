import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () { if (mounted) Navigator.pushReplacementNamed(context, '/onboarding'); });
  }
  @override
  Widget build(BuildContext context) => const Scaffold(body: SafeArea(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.directions_car_filled, color: navy, size: 70), SizedBox(height: 16), Text('PitStop.', style: TextStyle(fontSize: 46, fontWeight: FontWeight.w900, color: navy)), SizedBox(height: 8), Text('Your vehicle. Your peace of mind.'), SizedBox(height: 36), SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))]))));
}
