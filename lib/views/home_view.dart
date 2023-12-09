import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(Icons.menu, size: 60, color: Color(0xff0C173E)),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'BLINDIFY',
                  style: TextStyle(
                      fontFamily: 'LilitaOne',
                      fontSize: 75,
                      color: Color(0xff33AD97)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/menu');
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
                          'PLAY',
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
