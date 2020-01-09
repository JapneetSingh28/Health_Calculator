import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/functions.dart';
import 'package:health_calculator/screens/result_page.dart';

enum Gender {
  Male,
  Female,
}

class BmiInputPage extends StatefulWidget {
  @override
  _BmiInputPageState createState() => _BmiInputPageState();
}

class _BmiInputPageState extends State<BmiInputPage> {
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
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  barrierDismissible: true,
                  barrierColor: Colors.white12,
                  pageBuilder: (context, _, __) {
                    return BmiInfo();
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
                            result: calc.calculateBMI(),
                            resultText: calc.getResultBMI(),
                            interpretation: calc.getInterpretation(),
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

class BmiInfo extends StatefulWidget {
  @override
  _BmiInfoState createState() => _BmiInfoState();
}

class _BmiInfoState extends State<BmiInfo> {
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
                      TextSpan(text: "Body mass index (BMI)",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " is a value derived from the mass (weight)"
                          " and height of a person. The BMI is defined as the body mass divided by the"
                          " square of the body height, and is universally expressed in units of kg/m2,"
                          " resulting from mass in kilograms and height in metres."),
                      TextSpan(text: "\n\n\t\tBMI = Weight / (Height /100)^2",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "\n\nBMI",style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold ) ),
                      TextSpan(text: " provides a simple numeric measure of a person's thickness "
                          "or thinness, allowing health professionals to discuss weight problems more"
                          " objectively with their patients. BMI was designed to be used as a simple"
                          " means of classifying average sedentary (physically inactive) populations,"
                          " with an average body composition. For such individuals, the value "
                          "recommendations as of 2014 are as follows: a BMI from ",
                          style: TextStyle(fontSize:16 )),
                      TextSpan(text: "18.5 up to 25 kg/m2 ",
                        style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "may indicate ",style: TextStyle(fontSize:16 )),
                      TextSpan(text: "Optimal Weight",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " , a BMI ",style:TextStyle(fontSize:16 ) ),
                      TextSpan(text: "lower than 18.5",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " suggests the person is ",style:TextStyle(fontSize:16 ) ),
                      TextSpan(text: "Underweight",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " , a number from ",style: TextStyle(fontSize:16 )),
                      TextSpan(text: "25 up to 30 ",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "may indicate the person is ",style:TextStyle(fontSize:16 ) ),
                      TextSpan(text: "Overweight",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " , and a number from ",style:TextStyle(fontSize:16 ) ),
                      TextSpan(text: "30 upwards ",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: "suggests the person is ",style:TextStyle(fontSize:16 ) ),
                      TextSpan(text: "Obese",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text:" . Lean male"
                          " athletes often have a high muscle-to-fat ratio and therefore a BMI that is"
                          " misleadingly high relative to their body-fat percentage.",
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
