import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/functions.dart';
import 'package:health_calculator/screens/home_screen.dart';
import 'package:health_calculator/screens/result_page.dart';

enum Gender {
  Male,
  Female,
}

class WaterIntakeInputPage extends StatefulWidget {
  @override
  _WaterIntakeInputPageState createState() => _WaterIntakeInputPageState();
}

class _WaterIntakeInputPageState extends State<WaterIntakeInputPage> {
  Gender selectedGender;
  String type = selectedType.toString().replaceAll("Type.", "");
  final double iconSize = 90.0;

  int height = 180;
  double minHeight = 120;
  double maxHeight = 220;

  int weight = 70;
  int workout = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WATER INTAKE'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline,),
              onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  barrierDismissible: true,
                  barrierColor: Colors.white12,
                  pageBuilder: (context, _, __) {
                    return WaterInfo();
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
                          'Workout time',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          workout.toString(),
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
                                  workout--;
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
                                  workout++;
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
                  workout: workout,
                  selectedGender: selectedGender.toString());
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            result: calc.calculateWaterIntake(),
                            resultText: 'Liters of water per day:',
                            interpretation: 'You should bear in mind the fact that these are not '
                                'hard-and-fast numbers. You should consume water according to your '
                                'thirst levels.',
                          )));
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

class WaterInfo extends StatefulWidget {
  @override
  _WaterInfoState createState() => _WaterInfoState();
}

class _WaterInfoState extends State<WaterInfo> {
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
                      TextSpan(text: "Water Intake Calculator",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\nYou can use this water intake calculator to approximate the "
                          "amount of water you need to consume in relation to the amount of time you will"
                          " exercise and your body weight",style: TextStyle(fontSize:16 )),
                      TextSpan(text: "\n\n\t\tWater(in liters) = \n((Weight*2.205*2/3)+(Workout/30*12))*0.03",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\nYour body uses water throughout the day. It is eliminated through perspiration,"
                          " sweating, urine, bowel movements, and even breathing. To ensure your body functions as it should,"
                          " you should ensure that you replenish any water you lose by consuming drinks and food items that"
                          " contain water. But exactly how much water do you need? According to the National Academies of "
                          "Sciences, Engineering, and Medicine, the required daily fluid intake for an adult is as follows: ",
                          style: TextStyle(fontSize:16 )),
                      TextSpan(text: "\nFemales: 2.7 liters (11.5 cups ),",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\nMen: 3.7 liters (15.5 cups).",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " \nThe quantities outlined above include"
                          " the water consumed via drinks and food. In the majority of cases, around 20% of the daily fluid"
                          " intake is derived from food, and the remainder comes from drinks"
                          ,style: TextStyle(fontSize:16 )),
                    ]
                )
            ),
          ),
        ),
      ),
    );
  }
}

