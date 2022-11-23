import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import 'screens/child_details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/otp_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // '/': (context) => const LandingScreen(),
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        'login': (context) => const LoginScreen(),
        '/register': (context) => const SignUpScreen(),
        // '/register': (context) => const RegisterPage(),
        '/otp': (context) => const OTPScreen(),
        '/child': (context) => const ChildDetails(),
        
      },
    );
  }
}
