import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int step = 0;
  @override
  Widget build(BuildContext context) => PageShell(title: 'Password recovery', children: [
    Heading(step == 0 ? 'Forgot your password?' : step == 1 ? 'Check your code.' : 'Choose a new password.', 'This flow is a local demonstration. No email is sent.'),
    if (step == 0) DataForm(key: const ValueKey(0), fields: const {'Email': ''}, button: 'Get demo code', onSave: (_) => setState(() => step = 1)),
    if (step == 1) ...[const Panel(child: Text('Demo verification code: 123456')), DataForm(key: const ValueKey(1), fields: const {'Verification code': ''}, button: 'Verify code', onSave: (v) { if (v['Verification code'] == '123456') { setState(() => step = 2); } else { message(context, 'Incorrect demo code'); } })],
    if (step == 2) DataForm(key: const ValueKey(2), fields: const {'Password': '', 'Confirm Password': ''}, button: 'Finish demo reset', onSave: (v) { if (v['Password'] != v['Confirm Password']) { message(context, 'Passwords must match'); return; } message(context, 'Demo reset completed'); Navigator.pushReplacementNamed(context, '/login'); }),
  ]);
}
