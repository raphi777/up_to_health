import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:up_to_health/widgets/assessment_title.dart';

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
                      RatingBar.builder(
                        wrapAlignment: WrapAlignment.center,
                        initialRating: 3,
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
                        },
                      ),
                    ],
                  ),
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
