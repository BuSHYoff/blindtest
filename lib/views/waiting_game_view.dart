import 'dart:async';

import 'package:flutter/material.dart';

class WaitingGameView extends StatefulWidget {
  const WaitingGameView({super.key});

  @override
  State<WaitingGameView> createState() => WaitingGameViewState();
}

class WaitingGameViewState extends State<WaitingGameView> {
  dynamic _counter = 1;

  // ignore: non_constant_identifier_names
  _timeRemaining() {
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _counter++;
        if (_counter < 4) {
          _timeRemaining();
        } else {
          _counter = 'GO !!!';
          Timer(const Duration(milliseconds: 1000), () {
            Navigator.pop(context);
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _timeRemaining();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  'GAME STARTING',
                  style: TextStyle(
                      fontFamily: 'LilitaOne',
                      fontSize: 50,
                      color: Color(0xff33AD97)),
                ),
              ),
              Text(_counter.toString(), style: const TextStyle(fontSize: 45)),
            ],
          ),
        ));
  }
}
