import 'package:depi_assignment/screens/home_screen.dart';
import 'package:depi_assignment/screens/login_screen.dart';
import 'package:depi_assignment/screens/signup_screen.dart';
import 'package:depi_assignment/screens/welcom_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes
{
  static const String welcome='/';
  static const String logIn = '/logIn';
  static const String signUp='/signUp';
  static const String home='/home';

  static Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    logIn: (context) => const LoginScreen(),
    signUp:(context)=>const SignUpScreen(),
    home:(context)=>const HomeScreen(),

  };
}