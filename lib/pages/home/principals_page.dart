import 'package:flutter/material.dart';
import 'package:up_to_health/data/antiaging.dart';
import 'package:up_to_health/data/principals.dart';
import 'package:up_to_health/data/todos.dart';
import 'package:up_to_health/data/untersuchungen.dart';
import 'package:up_to_health/data/labortests.dart';
import 'package:up_to_health/data/wellbeing.dart';

class PrincipalsPage extends StatefulWidget {
  final category;
  PrincipalsPage(this.category);
  @override
  _PrincipalsPageState createState() => _PrincipalsPageState();
}

class _PrincipalsPageState extends State<PrincipalsPage>
    with AutomaticKeepAliveClientMixin {

  List<Principal> _getPrincipalsList(String category) {
    switch (category) {
      case 'untersuchungen': {
        return untersuchungen.toList();
      }
      break;

      case 'labortests': {
        return labortests.toList();
      }
      break;

      case 'todos': {
        return todos.toList();
      }
      break;

      case 'antiaging': {
        return antiaging.toList();
      }
      break;

      case 'wellbeing': {
        return wellbeing.toList();
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _principalsList = _getPrincipalsList(widget.category);
    return Scaffold(
      appBar: AppBar(
        title: Text("Deine UpToHealth Pricipals"),
      ),
      body: ListView.builder(
        itemCount: _principalsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('${_principalsList[index].subCategory}'),
                      content: Text('${_principalsList[index].description}'),
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
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.info_outlined),
                          ),
                          Text(
                            '${_principalsList[index].subCategory}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
