import 'package:bank_app/bloc/blur_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomButton extends StatelessWidget {
  final BlurState state;
  final BlurEvent blurEvent;
  const BottomButton({
    Key key,
    this.blurEvent,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.deepPurpleAccent),
      child: Text(state is BlurInitial ? 'Скрыть экран' : 'Показать экран',
          style: TextStyle(color: Colors.white)),
      onPressed: () {
        context.read<BlurBloc>().add(blurEvent);
      },
    );
  }
}
