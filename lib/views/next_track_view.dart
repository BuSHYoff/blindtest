import 'dart:async';

import 'package:flutter/material.dart';

class NextTrackView extends StatefulWidget {
  const NextTrackView({super.key});

  @override
  State<NextTrackView> createState() => NextTrackViewState();
}

class NextTrackViewState extends State<NextTrackView> {
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
            Navigator.pushNamed(context, '/game');
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
                  'NEXT MUSIC',
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
