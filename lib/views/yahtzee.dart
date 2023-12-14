import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';
import 'package:mp2/views/dicebox.dart';
import 'package:mp2/views/rolldicebutton.dart';
import 'package:mp2/models/scorecard.dart';
import 'package:mp2/views/scorecardview.dart';

class Yahtzee extends StatelessWidget {
  const Yahtzee({super.key});

  @override
  Widget build(BuildContext context) {
    // Returning the gameview widget, which has the main widgets
    return const GameView();
  }
}

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  final dice = Dice(5);
  final ScoreCard scoreCard = ScoreCard();

  @override
  Widget build(BuildContext context) {
    // Defining a parent column for all the widgets
    return Column(children: [
      // This listenable builder listens for the changeNotifier from dice object
      ListenableBuilder(
          listenable: dice,
          builder: (BuildContext context, Widget? child) {
            return Column(
              children: [
                // The heading of the game
                const Text("Yahtzee",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                // The boxes or cards where random rolls is displayed
                DiceBox(dice: dice),
                // The clickable button which generates random numbers of the dice
                RollDice(
                    onPressed: () => dice.performRollCount(),
                    turnNumber: dice.turns)
              ],
            );
          }),
      // This listenable builder listens for the changeNotifier from scorecard object
      ListenableBuilder(
          listenable: scoreCard,
          builder: (BuildContext context, Widget? child) {
            // The scorecard view which displays the total score and the score category to choose
            return ScoreCardView(scoreCard: scoreCard, dice: dice);
          })
    ]);
  }
}
