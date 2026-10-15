import 'package:flutter/material.dart';
import 'widgets/app_ui.dart';
import 'Screens/splash.dart';
import 'Screens/onboarding.dart';
import 'Screens/sign_up.dart';
import 'Screens/login.dart';
import 'Screens/forgot_password.dart';
import 'Screens/home.dart';
import 'Screens/garage.dart';
import 'Screens/add_vehicle.dart';
import 'Screens/edit_vehicle.dart';
import 'Screens/vehicle_overview.dart';
import 'Screens/documents.dart';
import 'Screens/reminders.dart';
import 'Screens/add_reminder.dart';
import 'Screens/service_history.dart';
import 'Screens/add_service.dart';
import 'Screens/service_detail.dart';
import 'Screens/warning_scanner.dart';
import 'Screens/bill_scanner.dart';
import 'Screens/warning_result.dart';
import 'Screens/bill_result.dart';
import 'Screens/ai_chat.dart';
import 'Screens/scan_history.dart';
import 'Screens/mechanic_map.dart';
import 'Screens/mechanic_list.dart';
import 'Screens/workshop_profile.dart';
import 'Screens/book_appointment.dart';
import 'Screens/bookings.dart';
import 'Screens/write_review.dart';
import 'Screens/expenses.dart';
import 'Screens/add_expense.dart';
import 'Screens/reports.dart';
import 'Screens/resale.dart';
import 'Screens/profile.dart';
import 'Screens/notifications.dart';
import 'Screens/premium.dart';
import 'Screens/settings.dart';

void main() => runApp(const PitStopApp());

class PitStopApp extends StatelessWidget {
  const PitStopApp({super.key});
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: store,
    builder: (context, child) => MaterialApp(
      title: 'PitStop',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: store.dark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => AnimatedBuilder(animation: store, builder: (context, _) => SplashScreen()),
        '/onboarding': (context) => AnimatedBuilder(animation: store, builder: (context, _) => OnboardingScreen()),
        '/sign_up': (context) => AnimatedBuilder(animation: store, builder: (context, _) => SignUpScreen()),
        '/login': (context) => AnimatedBuilder(animation: store, builder: (context, _) => LoginScreen()),
        '/forgot_password': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ForgotPasswordScreen()),
        '/home': (context) => AnimatedBuilder(animation: store, builder: (context, _) => HomeScreen()),
        '/garage': (context) => AnimatedBuilder(animation: store, builder: (context, _) => GarageScreen()),
        '/add_vehicle': (context) => AnimatedBuilder(animation: store, builder: (context, _) => AddVehicleScreen()),
        '/edit_vehicle': (context) => AnimatedBuilder(animation: store, builder: (context, _) => EditVehicleScreen()),
        '/vehicle_overview': (context) => AnimatedBuilder(animation: store, builder: (context, _) => VehicleOverviewScreen()),
        '/documents': (context) => AnimatedBuilder(animation: store, builder: (context, _) => DocumentsScreen()),
        '/reminders': (context) => AnimatedBuilder(animation: store, builder: (context, _) => RemindersScreen()),
        '/add_reminder': (context) => AnimatedBuilder(animation: store, builder: (context, _) => AddReminderScreen()),
        '/service_history': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ServiceHistoryScreen()),
        '/add_service': (context) => AnimatedBuilder(animation: store, builder: (context, _) => AddServiceScreen()),
        '/service_detail': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ServiceDetailScreen()),
        '/warning_scanner': (context) => AnimatedBuilder(animation: store, builder: (context, _) => WarningScannerScreen()),
        '/bill_scanner': (context) => AnimatedBuilder(animation: store, builder: (context, _) => BillScannerScreen()),
        '/warning_result': (context) => AnimatedBuilder(animation: store, builder: (context, _) => WarningResultScreen()),
        '/bill_result': (context) => AnimatedBuilder(animation: store, builder: (context, _) => BillResultScreen()),
        '/ai_chat': (context) => AnimatedBuilder(animation: store, builder: (context, _) => AiChatScreen()),
        '/scan_history': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ScanHistoryScreen()),
        '/mechanic_map': (context) => AnimatedBuilder(animation: store, builder: (context, _) => MechanicMapScreen()),
        '/mechanic_list': (context) => AnimatedBuilder(animation: store, builder: (context, _) => MechanicListScreen()),
        '/workshop_profile': (context) => AnimatedBuilder(animation: store, builder: (context, _) => WorkshopProfileScreen()),
        '/book_appointment': (context) => AnimatedBuilder(animation: store, builder: (context, _) => BookAppointmentScreen()),
        '/bookings': (context) => AnimatedBuilder(animation: store, builder: (context, _) => BookingsScreen()),
        '/write_review': (context) => AnimatedBuilder(animation: store, builder: (context, _) => WriteReviewScreen()),
        '/expenses': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ExpensesScreen()),
        '/add_expense': (context) => AnimatedBuilder(animation: store, builder: (context, _) => AddExpenseScreen()),
        '/reports': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ReportsScreen()),
        '/resale': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ResaleScreen()),
        '/profile': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ProfileScreen()),
        '/notifications': (context) => AnimatedBuilder(animation: store, builder: (context, _) => NotificationsScreen()),
        '/premium': (context) => AnimatedBuilder(animation: store, builder: (context, _) => PremiumScreen()),
        '/settings': (context) => AnimatedBuilder(animation: store, builder: (context, _) => SettingsScreen()),
        '/directory': (context) => AnimatedBuilder(animation: store, builder: (context, _) => ScreenDirectory()),
      },
    ),
  );
}

ThemeData buildTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme = ColorScheme.fromSeed(seedColor: navy, brightness: brightness);
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: dark ? const Color(0xFF101E2A) : paper,
    appBarTheme: AppBarTheme(backgroundColor: dark ? const Color(0xFF101E2A) : paper, foregroundColor: dark ? Colors.white : navy, elevation: 0, centerTitle: false),
    inputDecorationTheme: InputDecorationTheme(filled: true, fillColor: dark ? const Color(0xFF192E40) : Colors.white, contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFBCD0DC))), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFBCD0DC)))),
    filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(backgroundColor: navy, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)))),
    outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)))),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: dark ? const Color(0xFF192E40) : Colors.white, indicatorColor: ice),
  );
}

class ScreenDirectory extends StatelessWidget {
  const ScreenDirectory({super.key});
  @override
  Widget build(BuildContext context) => PageShell(title: 'All 36 screens', children: [
    const Heading('Explore PitStop.', 'Open any screen for your assignment demonstration.'),
    MenuTile('1. Splash', 'splash.dart', Icons.phone_android, onTap: () => go(context, '/splash')),
    MenuTile('2. Onboarding', 'onboarding.dart', Icons.phone_android, onTap: () => go(context, '/onboarding')),
    MenuTile('3. Create account', 'sign_up.dart', Icons.phone_android, onTap: () => go(context, '/sign_up')),
    MenuTile('4. PitStop.', 'login.dart', Icons.phone_android, onTap: () => go(context, '/login')),
    MenuTile('5. Password recovery', 'forgot_password.dart', Icons.phone_android, onTap: () => go(context, '/forgot_password')),
    MenuTile('6. PitStop.', 'home.dart', Icons.phone_android, onTap: () => go(context, '/home')),
    MenuTile('7. My Garage', 'garage.dart', Icons.phone_android, onTap: () => go(context, '/garage')),
    MenuTile('8. Add Vehicle', 'add_vehicle.dart', Icons.phone_android, onTap: () => go(context, '/add_vehicle')),
    MenuTile('9. Edit Vehicle', 'edit_vehicle.dart', Icons.phone_android, onTap: () => go(context, '/edit_vehicle')),
    MenuTile('10. Vehicle Overview', 'vehicle_overview.dart', Icons.phone_android, onTap: () => go(context, '/vehicle_overview')),
    MenuTile('11. Documents Vault', 'documents.dart', Icons.phone_android, onTap: () => go(context, '/documents')),
    MenuTile('12. Reminders', 'reminders.dart', Icons.phone_android, onTap: () => go(context, '/reminders')),
    MenuTile('13. Add Reminder', 'add_reminder.dart', Icons.phone_android, onTap: () => go(context, '/add_reminder')),
    MenuTile('14. Service History', 'service_history.dart', Icons.phone_android, onTap: () => go(context, '/service_history')),
    MenuTile('15. Add Service Record', 'add_service.dart', Icons.phone_android, onTap: () => go(context, '/add_service')),
    MenuTile('16. Service Detail', 'service_detail.dart', Icons.phone_android, onTap: () => go(context, '/service_detail')),
    MenuTile('17. Warning Light Scanner', 'warning_scanner.dart', Icons.phone_android, onTap: () => go(context, '/warning_scanner')),
    MenuTile('18. Bill Scanner', 'bill_scanner.dart', Icons.phone_android, onTap: () => go(context, '/bill_scanner')),
    MenuTile('19. Warning Light Result', 'warning_result.dart', Icons.phone_android, onTap: () => go(context, '/warning_result')),
    MenuTile('20. Bill Analysis', 'bill_result.dart', Icons.phone_android, onTap: () => go(context, '/bill_result')),
    MenuTile('21. AI Assistant', 'ai_chat.dart', Icons.phone_android, onTap: () => go(context, '/ai_chat')),
    MenuTile('22. Scan History', 'scan_history.dart', Icons.phone_android, onTap: () => go(context, '/scan_history')),
    MenuTile('23. Mechanic Finder', 'mechanic_map.dart', Icons.phone_android, onTap: () => go(context, '/mechanic_map')),
    MenuTile('24. Nearby Workshops', 'mechanic_list.dart', Icons.phone_android, onTap: () => go(context, '/mechanic_list')),
    MenuTile('25. Workshop Profile', 'workshop_profile.dart', Icons.phone_android, onTap: () => go(context, '/workshop_profile')),
    MenuTile('26. Book Appointment', 'book_appointment.dart', Icons.phone_android, onTap: () => go(context, '/book_appointment')),
    MenuTile('27. My Bookings', 'bookings.dart', Icons.phone_android, onTap: () => go(context, '/bookings')),
    MenuTile('28. Write a Review', 'write_review.dart', Icons.phone_android, onTap: () => go(context, '/write_review')),
    MenuTile('29. Expenses', 'expenses.dart', Icons.phone_android, onTap: () => go(context, '/expenses')),
    MenuTile('30. Add Expense', 'add_expense.dart', Icons.phone_android, onTap: () => go(context, '/add_expense')),
    MenuTile('31. Reports & Charts', 'reports.dart', Icons.phone_android, onTap: () => go(context, '/reports')),
    MenuTile('32. Resale Estimator', 'resale.dart', Icons.phone_android, onTap: () => go(context, '/resale')),
    MenuTile('33. Profile', 'profile.dart', Icons.phone_android, onTap: () => go(context, '/profile')),
    MenuTile('34. Notifications', 'notifications.dart', Icons.phone_android, onTap: () => go(context, '/notifications')),
    MenuTile('35. PitStop Premium', 'premium.dart', Icons.phone_android, onTap: () => go(context, '/premium')),
    MenuTile('36. Settings', 'settings.dart', Icons.phone_android, onTap: () => go(context, '/settings')),
  ]);
}
