import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timer/timer_bloc.dart';

class ActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _mapStateToActionButtons(
            timerBloc: BlocProvider.of<TimerBloc>(context)),
      );
}

List<Widget> _mapStateToActionButtons({TimerBloc timerBloc}) {
  final TimerState currentState = timerBloc.state;
  if (currentState is Ready) {
    return [_playButton(timerBloc)];
  } else if (currentState is Running) {
    return [_pauseButton(timerBloc), _replayButton(timerBloc)];
  } else if (currentState is Paused) {
    return [_playButton(timerBloc), _replayButton(timerBloc)];
  } else if (currentState is Finished) {
    return [_replayButton(timerBloc)];
  } else {
    throw Exception('Unknown state!');
  }
}

_playButton(TimerBloc timerBloc) => FloatingActionButton(
    child: Icon(Icons.play_arrow),
    onPressed: () => timerBloc.add(Start(duration: timerBloc.state.duration)));

_pauseButton(TimerBloc timerBloc) => FloatingActionButton(
      child: Icon(Icons.pause),
      onPressed: () => timerBloc.add(Pause()),
    );

_replayButton(TimerBloc timerBloc) => FloatingActionButton(
      child: Icon(Icons.replay),
      onPressed: () => timerBloc.add(Reset()),
    );
