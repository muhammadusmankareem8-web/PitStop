import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'PitStop.',  children: [

    const SizedBox(height: 36),
    const Heading('Welcome back.', 'Your garage is ready when you are.'),
    DataForm(fields: const {'Email': '', 'Password': ''}, button: 'Enter demo', onSave: (v) { store.email = v['Email']!; store.refresh(); home(context); }),
    TextButton(onPressed: () => go(context, '/forgot_password'), child: const Text('Forgot password?')),
    ActionButton('Create an account', () => go(context, '/sign_up'), secondary: true),
    const Text('Demo only. Any valid email and password of 6 or more characters will work.'),

  ]);
}
