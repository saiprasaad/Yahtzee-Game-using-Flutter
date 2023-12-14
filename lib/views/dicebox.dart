import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';

class DiceBox extends StatelessWidget {
  final Dice dice;
  const DiceBox({super.key, required this.dice});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(right: 200, left: 200, top: 10, bottom: 10),
        child: Row(
            // Iterating through the dice values
            children: List.generate(5, (i) {
          return Expanded(
              child: Card(
                 // If the dice is rolled and if the dice is held, change the border color
                  shape: dice.turns != 0 && dice.isHeld(i)
                      ? const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red, width: 3.0))
                      : RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 1.0), borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        // The dice is toggled on tapping the dice
                        if (dice.values.isNotEmpty) {
                          dice.toggleHold(i);
                        }
                      },
                      // The text which displays the dice value
                      child: ListTile(
                        title: Text(
                          dice.values.isNotEmpty
                              ? dice.values[i].toString()
                              : "",
                          textAlign: TextAlign.center,
                        ),
                      ))));
        })));
  }
}
