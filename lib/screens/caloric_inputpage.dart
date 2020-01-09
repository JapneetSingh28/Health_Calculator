import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/functions.dart';
import 'package:health_calculator/screens/activity_page.dart';

enum Gender {
  Male,
  Female,
}

class CaloricInputPage extends StatefulWidget {
  @override
  _CaloricInputPageState createState() => _CaloricInputPageState();
}

class _CaloricInputPageState extends State<CaloricInputPage> {
  Gender selectedGender;
  final double iconSize = 90.0;

  int height = 180;
  double minHeight = 120;
  double maxHeight = 220;

  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALORIES CALCULATOR'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  barrierDismissible: true,
                  barrierColor: Colors.white12,
                  pageBuilder: (context, _, __) {
                    return CaloriesInfo();
                  })))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: Card(
                      color: selectedGender == Gender.Male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: iconSize,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'MALE',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    child: Card(
                      color: selectedGender == Gender.Female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: iconSize,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'FEMALE',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.minus),
                              constraints: BoxConstraints.tightFor(
                                width: 54.0,
                                height: 48.0,
                              ),
                              elevation: 6.0,
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.plus),
                              constraints: BoxConstraints.tightFor(
                                width: 54.0,
                                height: 48.0,
                              ),
                              elevation: 6.0,
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.minus),
                              constraints: BoxConstraints.tightFor(
                                width: 54.0,
                                height: 48.0,
                              ),
                              elevation: 6.0,
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RawMaterialButton(
                              child: Icon(FontAwesomeIcons.plus),
                              constraints: BoxConstraints.tightFor(
                                width: 54.0,
                                height: 48.0,
                              ),
                              elevation: 6.0,
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: height,
                  weight: weight,
                  age: age,
                  selectedGender: selectedGender.toString());
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActivityPage(calc.calculateBMR())));
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              height: kBottomContainerHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CaloriesInfo extends StatefulWidget {
  @override
  _CaloriesInfoState createState() => _CaloriesInfoState();
}

class _CaloriesInfoState extends State<CaloriesInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan(
                    children:<TextSpan>[
                      TextSpan(text: "Calorie Calculator",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\nThe Calorie Calculator can be used to estimate the number "
                          "of calories a person needs to consume each day. This calculator can also "
                          "provide some simple guidelines to maintain weight. "
                          "This Calorie Calculator is based on several equations, and the results of "
                          "the calculator are based on an estimated average. The Mifflin-St Jeor Equation "
                          "also calculates BMR, and has been shown to be more accurate than the revised "
                          "Harris-Benedict Equation."),
                      TextSpan(text: "\n\nThe Mifflin St Jeor Equation",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\t\t\n\nFor Male:",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\t\tBMR=10 *Weight +6.25 *Height -5 *Age +5",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\t\t\n\nFor Female:",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\t\tBMR=10 *Weight +6.25 *Height -5 *Age -161",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\nThe value obtained from these equations is the estimated"
                          " number of calories a person can consume in a day to maintain their"
                          " body-weight, assuming they remain at rest. This value is multiplied"
                          " by an activity factor (generally 1.2-1.95), dependent on a person's"
                          " typical levels of exercise, in order to obtain a more realistic value"
                          " for maintaining body-weight (since people are less likely to be at rest"
                          " throughout the course of an entire day). 1 pound, or approximately 0.45"
                          " kg, equates to about 3,500 calories. As such, in order to lose 1 pound per"
                          " week, it is recommended that 500 calories be shaved off the estimate of "
                          "calories necessary for weight maintenance per day. For example, if a person"
                          " has an estimated allotment of 2,500 calories per day to maintain body-weight,"
                          " consuming 2,000 calories per day for one week would theoretically result in 3,500"
                          " calories (or 1 pound) lost during the period.",
                          style: TextStyle(fontSize:16 )),

                    ]
                )
            ),
          ),
        ),
      ),
    );
  }
}

