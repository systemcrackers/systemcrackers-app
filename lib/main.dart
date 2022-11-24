import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uia_app/screens/dyslexia_screen.dart';
import 'package:uia_app/services/shared_service.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import 'screens/autism_quiz_screen.dart';
import 'screens/child_details_screen.dart';
import 'screens/email_report.dart';
import 'screens/home_screen.dart';
import 'screens/know_more_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/text_to_speech.dart';

Widget _defaultHome = const LoginScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();

  if (_result) {
    _defaultHome = const HomeScreen();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // '/': (context) => const LandingScreen(),
        '/': (context) => _defaultHome,
        '/home': (context) => const HomeScreen(),
        'login': (context) => const LoginScreen(),
        '/register': (context) => const SignUpScreen(),
        // '/register': (context) => const RegisterPage(),
        '/otp': (context) => const OTPScreen(),
        '/child': (context) => const ChildDetails(),
        '/dyslexia': (context) => const DyslexiaScreen(),
        '/autism': (context) => const AutismQuizScreen(),
        '/know_more': (context) => KnowMoreScreen(),
        '/email_report': (context) => const EmailReport(),
        '/text_to_speech': (context) => const TextToSpeech(),
      },
    );
  }
}
