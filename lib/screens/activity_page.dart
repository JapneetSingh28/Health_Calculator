import 'package:flutter/material.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/screens/result_page.dart';

enum Activity {
  moderate_exercise,
  hard_exercise,
  very_hard_exercise,
}

class ActivityPage extends StatefulWidget {
  final String bmr;

  ActivityPage(@required this.bmr);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  Activity selectedActivity;
  double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your Activity"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    result = double.parse(widget.bmr) * 1.55;
                    selectedActivity = Activity.moderate_exercise;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  result: result.toStringAsFixed(1),
                                  resultText: "Your daily Calories requriment:",
                                  interpretation: "Calories/day",
                                )));
                  });
                },
                child: Card(
                  color: selectedActivity == Activity.moderate_exercise
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Moderately Active.',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('Sports 3-5 days/week.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    result = double.parse(widget.bmr) * 1.725;
                    selectedActivity = Activity.hard_exercise;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  result: result.toStringAsFixed(1),
                                  resultText: "Your daily Calories requriment:",
                                  interpretation: "Calories/day",
                                )));
                  });
                },
                child: Card(
                  color: selectedActivity == Activity.hard_exercise
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Very Active.',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('Sports 6-7 days a week.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    result = double.parse(widget.bmr) * 1.9;
                    selectedActivity = Activity.very_hard_exercise;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  result: result.toStringAsFixed(1),
                                  resultText: "Your daily Calories requriment:",
                                  interpretation: "Calories/day",
                                )));
                  });
                },
                child: Card(
                  color: selectedActivity == Activity.very_hard_exercise
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Extra Active.',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text('Sports & Physical job or 2x training.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
