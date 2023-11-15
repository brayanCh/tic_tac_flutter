import 'package:flutter/cupertino.dart';
import './tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Tic Tac Toe'),
      ),
      child: Container(
          padding: const EdgeInsets.only(top: 190),
          height: double.infinity,
          width: double.infinity,
          child: const Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Tile(),
                  Tile(),
                  Tile(),
                ],
              ),
              Column(
                children: [
                  Tile(),
                  Tile(),
                  Tile(),
                ],
              ),
              Column(
                children: [
                  Tile(),
                  Tile(),
                  Tile(),
                ],
              ),
            ],
          ))),
    );
  }
}
