import 'package:confession/provider/confession_provider.dart';
import 'package:confession/screens/addScreen.dart';
import 'package:confession/screens/confession_detail_screen.dart';
import 'package:confession/screens/home_screen.dart';

import 'package:confession/screens/login_screen.dart';
import 'package:confession/screens/opening_screen.dart';
import 'package:confession/screens/reset_password_screen.dart';
import 'package:confession/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/bottom_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConfessionProvider(),
        ),
      ],
      child: MaterialApp(
        title: "ASMT Confession",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        home: BottomBarScreen(),
        // OpeningScreen(),
        routes: {
          ConfessionDetailScreen.routeName: (ctx) => ConfessionDetailScreen(),
          "/signup_screen": (ctx) => SignupScreen(),
          "/login_screen": (ctx) => LoginScreen(),
          '/opening_screen': (ctx) => OpeningScreen(),
          '/bottombar_screen': (ctx) => BottomBarScreen(),
          ResetPasswordScreen.routeName: (ctx) => ResetPasswordScreen(),
          '/add_screen': (ctx) => AddScreen(),
        },
      ),
    );
  }
}
