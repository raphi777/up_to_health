import 'package:flutter/material.dart';
import 'package:up_to_health/pages/registration/assessment_00_page.dart';
import 'package:up_to_health/widgets/button_letsgo.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 275,
            height: 275,
            child: Stack(
              children:[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffd5eeff),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffd6efff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonLetsgo(Assessment00Page()),
        ],
      ),
    );
  }
}
