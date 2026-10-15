import 'package:flutter/material.dart';
import '../../widgets/app_ui.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'Create account',  children: [

    const Heading('Start your journey.', 'Keep your vehicle life in one place.'),
    DataForm(fields: const {'Name': '', 'Email': '', 'Password': '', 'Confirm Password': ''}, button: 'Create demo account', onSave: (v) {
      if (v['Password'] != v['Confirm Password']) { message(context, 'Passwords must match'); return; }
      store.name = v['Name']!; store.email = v['Email']!; store.refresh(); home(context);
    }),
    TextButton(onPressed: () => Navigator.pushReplacementNamed(context, '/login'), child: const Text('Already registered? Log in')),
    const Text('Frontend demo. No account is created on a server.'),

  ]);
}
