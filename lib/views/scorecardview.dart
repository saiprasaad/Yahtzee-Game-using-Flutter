import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';
import 'package:mp2/models/scorecard.dart';

class ScoreCardView extends StatelessWidget {
  final ScoreCard scoreCard;
  final Dice dice;
  ScoreCardView({super.key, required this.scoreCard, required this.dice});
  final descriptionMap = {"ones":"Count and add only ones", "twos": "Count and add only twos", "threes":"Count and add only threes", 
  "fours": "Count and add only fours", "fives": "Count and add only fives", "sixes":"Count and add only sixes", 
  "threeOfAKind":"Add total of all dice", "fourOfAKind":"Add total of all dice", "fullHouse":"Score 25", "smallStraight":"Score 30", 
  "largeStraight":"Score 40", "yahtzee":"Score 50", "chance":"Score total of all 5 dice"};

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Displays the total score of the game
      Text("Score: ${scoreCard.total}", style: const TextStyle(fontSize: 30)),
      const SizedBox(height: 10),
      SizedBox(
          height: 450,
          width: 800,
          child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 100,
                  mainAxisSpacing: 2,
                  childAspectRatio: 6.0,
                  crossAxisCount: 2),
              children: [
                // Iterating the enum values
                for (var value in ScoreCategory.values)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          value
                                  .toString()
                                  .split('.')
                                  .elementAt(1)[0]
                                  .toUpperCase() +
                              value
                                  .toString()
                                  .split('.')
                                  .elementAt(1)
                                  .substring(
                                    1,
                                  ),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          descriptionMap.containsKey(value
                                  .toString()
                                  .split('.')
                                  .elementAt(1))? 
                          descriptionMap[value
                                  .toString()
                                  .split('.')
                                  .elementAt(1)]! : "" )
                          
                      ]),

                      const SizedBox(width: 50),
                      // The pick button for each category
                      FilledButton.tonal(
                          onPressed: scoreCard[value] == null
                              ? () => {
                                    scoreCard.registerScore(value, dice.values),
                                    dice.clear(),
                                    // The alert is displayed when the game is over
                                    if (scoreCard.completed)
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: const Text(
                                                    'You have completed the Game'),
                                                content: Text(
                                                    'Score: ${scoreCard.total}'),
                                                // Once the OK button in dialog is clicked, the dice and the scorecard must be cleared
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () => {
                                                      dice.clear(),
                                                      scoreCard.clear(),
                                                      Navigator.pop(
                                                          context, 'OK')
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ))
                                  }
                              : null,
                          child: const Text("Pick")),
                    ],
                  )
              ]))
    ]);
  }
}
