import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompassPage extends StatefulWidget {
  @override
  _CompassPageState createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage>
    with AutomaticKeepAliveClientMixin {
  List<String> _ratingQuestionsList = [
    "Du hast dich grundsätzlich topfit gefühlt, mental wie körperlich",
    "Du hast dich gesund ernährt",
    "Du hast ausreichend Wasser getrunken",
    "Du hast dich ausreichend bewegt",
    "Du hast genügend Schlaf bekommen",
    "Du hast eine Routine-Untersuchung beim Arzt wahrgenommen",
    "Du hast deine \"To-Do's für dich\" pflichtbewusst ausgeführt (z.B. selbst abtasten)",
  ];
  List<double> _ratingPointsList = [0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpToHealth Compass'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              child: Text(
                "Wie geht es dir heute ?",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _ratingQuestionsList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(_ratingQuestionsList[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 16.0),
                        child: RatingBar.builder(
                          wrapAlignment: WrapAlignment.center,
                          initialRating: 0,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.red,
                                );
                              case 1:
                                return Icon(
                                  Icons.sentiment_dissatisfied,
                                  color: Colors.redAccent,
                                );
                              case 2:
                                return Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.amber,
                                );
                              case 3:
                                return Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.lightGreen,
                                );
                              case 4:
                                return Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.green,
                                );
                            }
                            return null;
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                            print(index);
                            _ratingPointsList[index] = rating;
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Speichern'),
              onPressed: () {
                var score = 0.0;
                for (var i = 0; i < _ratingPointsList.length; i++) {
                  score = score + _ratingPointsList[i];
                  print('Rating No $i ' + _ratingPointsList[i].toString());
                }
                var compassMsg;
                if (score >= 25) {
                  compassMsg = 'Dein UpToHealth-Score ist weltklasse - weiter so und ja nich nachlassen!';
                }
                if (score < 25 && score >= 15) {
                  compassMsg = 'Du stehst schon ganz gut da, aber da ist auf jeden Fall noch Luft nach oben - achte stehts auf eine gesunde Lebensweise und du wirst sehen wie stark sich dein UpToHealth-Score noch verbessern lässt';
                }
                if (score < 15) {
                  compassMsg = 'Da gibt es noch viel Nachholbedarf. Mach dich am besten noch einmal mit deinen UpToHealth-Principals vertraut, um zu verstehen, was für dich und eine gesunde Lebensweise wichtig ist';
                }
                print('score: $score');
                int iScore = score.toInt();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Dein heutiger Score beträgt $iScore!'),
                      content: Text(compassMsg),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'))
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
