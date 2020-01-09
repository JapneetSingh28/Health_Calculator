import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/functions.dart';
import 'package:health_calculator/screens/result_page.dart';

enum Gender {
  Male,
  Female,
}

class IdealWeightInputPage extends StatefulWidget {
  @override
  _IdealWeightInputPageState createState() => _IdealWeightInputPageState();
}

class _IdealWeightInputPageState extends State<IdealWeightInputPage> {
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
        title: Text('IDEAL WEIGHT'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline,),
              onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  barrierDismissible: true,
                  barrierColor: Colors.white12,
                  pageBuilder: (context, _, __) {
                    return IdealInfo();
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
                      builder: (context) => ResultPage(
                        result: calc.calculateIdealWeight(),
                        resultText: calc.getResultIdealWeight(),
                        interpretation: "Kg",
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

class IdealInfo extends StatefulWidget {
  @override
  _IdealInfoState createState() => _IdealInfoState();
}

class _IdealInfoState extends State<IdealInfo> {
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
                      TextSpan(text: "Ideal Weight Calculator",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\nThe Ideal Weight Calculator computes ideal bodyweight (IBW) ranges based on height"
                          ", gender, and age. The idea of finding the IBW using a formula has been sought after by many "
                          "experts for a long time. Currently, there persist several popular formulas, and our Ideal "
                          "Weight Calculator provides their results for side-to-side comparisons.",
                          style: TextStyle(fontSize:16 )),
                      TextSpan(text: "\n\nG. J. Hamwi Formula (1964)",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\t\t\n\nFor Male:",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\t\tIdeal Weight = 48.0 kg + 2.7 kg per inch over 5 feet",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\t\t\n\nFor Female:",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\t\tIdeal Weight = 45.5 kg + 2.2 kg per inch over 5 feet",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\nMost everyone has at some point tried to lose weight, or at least known"
                          " somebody who has. This is largely due to the perception of an ideal body weight, which"
                          " is often based on what we see promoted through various media such as social media, TV, "
                          "movies, magazines, etc. Although ideal body weight (IBW) today is sometimes based on "
                          "perceived visual appeal, IBW was actually introduced to estimate dosages for medical "
                          "use, and the formulas that calculate it are not at all related to how a person looks "
                          "at a given weight. It has since been determined that the metabolism of certain drugs "
                          "is more based on IBW than it is total body weight. Today, IBW is also used widely throughout"
                          " sports, since many sports classify people based on their body weight.",
                          style: TextStyle(fontSize:16 )),
                      TextSpan(text: "\nNote that IBW is not a perfect measurement.",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " \nIt does not consider the percentages of body fat and muscle in a person's body."
                          " This means that it is possible for highly fit, healthy athletes to be considered overweight "
                          "based on their IBW. This is why IBW should be considered with the perspective that it is an "
                          "imperfect measure and not necessarily indicative of health, or a weight that a person should"
                          " necessarily strive toward; it is possible to be over or under your IBW and be perfectly healthy."
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