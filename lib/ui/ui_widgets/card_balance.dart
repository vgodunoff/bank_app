import 'package:flutter/material.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('Баланс по карте Visa ...4568 составляет 15000 д.е.'),
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
