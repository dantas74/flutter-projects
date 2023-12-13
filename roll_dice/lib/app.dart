import 'package:first_app/components/molecules/dice_roller.dart';
import 'package:first_app/layouts/default.dart';
import 'package:flutter/material.dart';

class RollDiceApp extends StatelessWidget {  
  const RollDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: DefaultLayout(
          child: Center(
            child: DiceRoller()
          ),
        ),
      ),
    );
  }
}
