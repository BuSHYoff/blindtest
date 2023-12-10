import 'package:flutter/material.dart';

class GameOverView extends StatefulWidget {
  const GameOverView({super.key});

  @override
  State<GameOverView> createState() => GameOverViewState();
}

class GameOverViewState extends State<GameOverView> {

  final String gameOverLabel = "VICTORY";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  gameOverLabel,
                  style: const TextStyle(
                      fontFamily: 'LilitaOne',
                      fontSize: 75,
                      color: Color(0xff33AD97)),
                ),
              ),
              SizedBox(
                  width: 400,
                  height: 150,
                  child: SizedBox(
                      width: 150,
                      child: Image.asset(
                        'assets/images/chest.png',
                      ))),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff0C173E)), // background
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(
                                  width: 3, color: Colors.black),
                            ),
                          ),
                        ),
                        child: const Text(
                          'MENU',
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ))),
              ),
              Container(
                  width: 400,
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      width: 150,
                      child: Image.asset(
                        'assets/images/click.gif',
                      )))
            ],
          ),
        ));
  }
}
