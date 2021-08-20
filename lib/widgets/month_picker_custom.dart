import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MonthPickerCustom extends StatefulWidget {
  @override
  _MonthPickerCustomState createState() => _MonthPickerCustomState();
}

class _MonthPickerCustomState extends State<MonthPickerCustom> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Flexible(
            child: TextField(
              controller: monthController,
              maxLength: 2,
              decoration: InputDecoration(
                labelText: "MM",
                counterText: "",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          new Flexible(
            child: Text("/"),
          ),
          new Flexible(
            child: TextField(
              controller: yearController,
              maxLength: 4,
              decoration: InputDecoration(
                labelText: "YYYY",
                counterText: "",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      ),
    );
  }
}
