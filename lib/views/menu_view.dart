import 'package:flutter/material.dart';
import 'package:blindtest/views/widgets/card_mode.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => MenuViewState();
}

class MenuViewState extends State<MenuView> {
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
                margin: const EdgeInsets.only(bottom: 60),
                child: const Text(
                  'CHOOSE MODE',
                  style: TextStyle(
                      fontFamily: 'LilitaOne',
                      fontSize: 50,
                      color: Color(0xff0C173E)),
                ),
              ),
              const Column(children: <Widget>[
                CardMode(label: 'NORMAL'),
                SizedBox(height: 10),
                CardMode(label: 'REVERSE'),
                SizedBox(height: 10),
                CardMode(label: 'MULTIPLAYER'),
                SizedBox(height: 10),
                CardMode(label: 'PLAYLIST'),
              ])
            ],
          ),
        ));
  }
}
