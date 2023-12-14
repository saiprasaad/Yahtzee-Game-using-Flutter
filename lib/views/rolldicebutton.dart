import 'package:flutter/material.dart';

class RollDice extends StatelessWidget {
  final int? turnNumber;
  final VoidCallback? onPressed;
  const RollDice({this.turnNumber, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 20, left: 10, top: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, 
          ),
          // After the dice is rolled three times, the button should not perform any action onPressed
          onPressed: turnNumber != 3 ? onPressed : null,
          // After the dice is rolled three times, the text of the button is changed to out of rolls
          child: turnNumber != 3
              ? Text("Roll Dice (${turnNumber! + 1})")
              : const Text("Out of Rolls")),
    );
  }
}
