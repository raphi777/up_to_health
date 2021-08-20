import 'package:flutter/material.dart';
import 'package:up_to_health/data/principals.dart';
import 'package:up_to_health/data/user_principals.dart';
import 'package:up_to_health/data/uth_user.dart';

class PrincipalsPage extends StatefulWidget {
  final category;
  final UthUser uthUser;

  PrincipalsPage(this.category, this.uthUser);

  @override
  _PrincipalsPageState createState() => _PrincipalsPageState();
}

class _PrincipalsPageState extends State<PrincipalsPage>
    with AutomaticKeepAliveClientMixin {
  List<Principal> _getPrincipalsList(String category, UthUser user) {
    switch (category) {
      case 'untersuchungen':
        {
          return UserPrincipals().getUntersuchungen(user);
        }
        break;

      case 'labortests':
        {
          return UserPrincipals().getLabortests(user);
        }
        break;

      case 'todos':
        {
          return UserPrincipals().getTodos(user);
        }
        break;

      case 'antiaging':
        {
          return UserPrincipals().getAntiaging(user);
        }
        break;

      case 'wellbeing':
        {
          return UserPrincipals().getWellbeing(user);
        }
        break;
    }
  }

  String _getHeader(String category) {
    switch (category) {
      case 'untersuchungen':
        {
          return 'Untersuchungen';
        }
        break;

      case 'labortests':
        {
          return 'Labortests';
        }
        break;

      case 'todos':
        {
          return "To-Do's für dich";
        }
        break;

      case 'antiaging':
        {
          return 'Anti-Aging';
        }
        break;

      case 'wellbeing':
        {
          return 'Wellbeing';
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    super.build(context);
    var _principalsList = _getPrincipalsList(widget.category, widget.uthUser);
    return Scaffold(
      appBar: AppBar(
        title: Text(_getHeader(widget.category)),
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
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: Text('${_principalsList[index].subCategory}'),
                        content: Text('${_principalsList[index].description}'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'))
                        ],
                      ),
                    );
                  },
                );
              },
              child: SizedBox(
                //height: 80,
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
                            Container(
                              width: width * 0.7,
                              child: Text(
                                '${_principalsList[index].subCategory}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
