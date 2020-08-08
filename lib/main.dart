import 'package:confession/provider/confession_provider.dart';
import 'package:confession/screens/confession_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/bottom_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class  MyApp extends StatelessWidget {
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
        routes:{
          ConfessionDetailScreen.routeName:(ctx)=>ConfessionDetailScreen()
        },
      ),
    );
  }
}
