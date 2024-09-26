import 'package:flutter/material.dart';
import 'package:food_shop/screens/LandingPage.dart';
import 'package:provider/provider.dart';
import 'package:food_shop/screens/auth_provider.dart';
import 'package:food_shop/screens/Home.dart';
import 'package:food_shop/screens/login_screen.dart';
import 'package:food_shop/screens/SignUpScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/main': (context) => Home(), // Main screen after login
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
