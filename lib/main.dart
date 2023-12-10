import 'package:blindtest/views/game.dart';
import 'package:blindtest/views/home_view.dart';
import 'package:blindtest/views/next_track_view.dart';
import 'package:blindtest/views/waiting_game_view.dart';
import 'package:flutter/material.dart';
import 'package:blindtest/views/menu_view.dart';
import 'package:blindtest/views/game_over_view.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  int round = 0;
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
          '/waiting_game': (context) => const WaitingGameView(),
          '/game': (context) {
            round++;
            return GameView(round: round);
          },
          '/next_track': (context) => const NextTrackView(),
          '/game_over': (context) => const GameOverView()
        });
  }
}
