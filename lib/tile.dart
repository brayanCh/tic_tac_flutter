import 'package:flutter/cupertino.dart';

enum Pressed {
  pressedByUser,
  pressedByOpponent,
  notPressed,
}

String returnText(Pressed pressed) {
  switch (pressed) {
    case Pressed.pressedByUser:
      return 'X';
    case Pressed.pressedByOpponent:
      return 'O';
    case Pressed.notPressed:
      return '';
  }
}

class Tile extends StatefulWidget {
  const Tile({Key? key}) : super(key: key);

  @override
  State<Tile> createState() => TileState();
}

class TileState extends State<Tile> {
  Pressed _pressed = Pressed.notPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _pressed = Pressed.pressedByUser;
          });
        },
        child: Container(
          color: const Color.fromARGB(255, 0, 100, 255),
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              returnText(_pressed),
              style: const TextStyle(
                color: CupertinoColors.white,
              ),
            ),
          ),
        ));
  }
}
