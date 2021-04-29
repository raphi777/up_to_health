import 'package:flutter/material.dart';
import 'principals_page.dart';

class PrincipalsCategoriesPage extends StatefulWidget {
  @override
  _PrincipalsCategoriesPageState createState() =>
      _PrincipalsCategoriesPageState();
}

class _PrincipalsCategoriesPageState extends State<PrincipalsCategoriesPage>
    with AutomaticKeepAliveClientMixin {
  List<String> _principalsList = [
    "Untersuchungen",
    "Labortests",
    "To-Do's für dich",
    "Anti-Aging",
    "Wellbeing",
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Deine UpToHealth Pricipals"),
      ),
      body: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrincipalsPage('untersuchungen'))),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  /*child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        'assets/images/undraw_science_fqhl.svg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),*/
                ),
                Text('Untersuchungen'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrincipalsPage('labortests'))),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  /*child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        'assets/images/undraw_science_fqhl.svg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),*/
                ),
                Text('Labortests'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrincipalsPage('labortests'))),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  /*child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        'assets/images/undraw_science_fqhl.svg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),*/
                ),
                Text("To-Do's für dich"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrincipalsPage('labortests'))),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  /*child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        'assets/images/undraw_science_fqhl.svg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),*/
                ),
                Text('Anti-Aging'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrincipalsPage('labortests'))),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  /*child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        'assets/images/undraw_science_fqhl.svg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),*/
                ),
                Text('Wellbeing'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
