import 'package:flutter/material.dart';
import 'package:blindtest/views/MenuView.dart';
import 'package:blindtest/views/HomeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'LilitaOne',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff86E4DF))
            .copyWith(background: const Color(0xff86E4DF)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff86E4DF),
          foregroundColor: Color(0xff0C173E),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/menu': (context) => const MenuView(),
      }
    );
  }
}
