import 'package:flutter/material.dart';

// ignore: unused_element
class CardMode extends StatelessWidget {
  final String label;
  const CardMode({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff33AD97),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: const Color(0xff0C173E),
        onTap: () {
          Navigator.pushNamed(context, '/waiting_game');
        },
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
              child: Text(label,
                  style: const TextStyle(color: Colors.white, fontSize: 30))),
        ),
      ),
    );
  }
}
