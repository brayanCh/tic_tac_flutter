import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './tile.dart';
import 'blocs/match/match_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(providers: [
        BlocProvider<MatchBloc>(
          create: (contex) => MatchBloc(),
        ),
      ], child: const MyHomePage()),
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
    return BlocBuilder<MatchBloc, MatchState>(builder: (context, state) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
              state.gameStatus == Status.playing ? 'Playing' : 'Game Over'),
          leading: GestureDetector(
            onTap: () {
              BlocProvider.of<MatchBloc>(context).add(ResetMatch());
            },
            child: const Icon(CupertinoIcons.refresh,
                color: CupertinoColors.white),
          ),
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
                    Tile(value: '00'),
                    Tile(value: '01'),
                    Tile(value: '02'),
                  ],
                ),
                Column(
                  children: [
                    Tile(value: '10'),
                    Tile(value: '11'),
                    Tile(value: '12'),
                  ],
                ),
                Column(
                  children: [
                    Tile(value: '20'),
                    Tile(value: '21'),
                    Tile(value: '22'),
                  ],
                ),
              ],
            ))),
      );
    });
  }
}
