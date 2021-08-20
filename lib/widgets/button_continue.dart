import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {

  ButtonContinue(this.page);
  final Widget page;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
            child: Text('Weiter'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(width / 1.2, width / 8)),
            ),
          ),
        ),
      ),
    );
  }
}
