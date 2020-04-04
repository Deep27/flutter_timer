import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timer/timer_bloc.dart';
import 'package:flutter_timer/ticker.dart';

void main() => runApp(FlutterTimer());

class FlutterTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(109, 234, 255, 1),
          accentColor: Color.fromRGBO(72, 74, 126, 1),
          brightness: Brightness.dark),
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: Timer(), // @TODO
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
