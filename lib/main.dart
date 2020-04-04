import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timer/timer_bloc.dart';
import 'package:flutter_timer/ticker.dart';
import 'package:flutter_timer/widgets/timer_widget.dart';

void main() => runApp(FlutterTimer());

class FlutterTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: TimerWidget(),
      ),
    );
  }
}
