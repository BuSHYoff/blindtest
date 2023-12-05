import 'package:flutter/material.dart';

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
            leading: const IconButton(
          icon: Icon(Icons.menu, size: 60, color: Color(0xff0C173E)),
          onPressed: null,
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
              Column(children: <Widget>[
                Card(
                  color: const Color(0xff33AD97),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child:Text('NORMAL', style: TextStyle(color: Colors.white, fontSize: 30))),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  color: const Color(0xff33AD97),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child:Text('REVERSE', style: TextStyle(color: Colors.white, fontSize: 30))),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  color: const Color(0xff33AD97),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child:Text('MULTIPLAYER', style: TextStyle(color: Colors.white, fontSize: 30))),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  color: const Color(0xff33AD97),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child:Text('PLAYLIST', style: TextStyle(color: Colors.white, fontSize: 30))),
                    ),
                  ),
                )
              ])
            ],
          ),
        ));
  }
}
