import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/functions.dart';
import 'package:health_calculator/screens/result_page.dart';

enum Gender {
  Male,
  Female,
}

class BmrInputPage extends StatefulWidget {
  @override
  _BmrInputPageState createState() => _BmrInputPageState();
}

class _BmrInputPageState extends State<BmrInputPage> {
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
        title: Text('BMR CALCULATOR'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  barrierDismissible: true,
                  barrierColor: Colors.white12,
                  pageBuilder: (context, _, __) {
                    return BmrInfo();
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
                            result: calc.calculateBMR(),
                            resultText: "Your BMR is:",
                            interpretation: "",
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

class BmrInfo extends StatefulWidget {
  @override
  _BmrInfoState createState() => _BmrInfoState();
}

class _BmrInfoState extends State<BmrInfo> {
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
                      TextSpan(text: "Basal metabolic rate (BMR)",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " is the rate of energy expenditure per unit time by endothermic "
                          "animals at rest. It is reported in energy units per unit time ranging from"
                          " watt (joule/second) to ml O2/min or joule per hour per kg body mass J/(h·kg). "
                          "Proper measurement requires a strict set of criteria be met. These criteria "
                          "include being in a physically and psychologically undisturbed state, in a thermally"
                          " neutral environment, while in the post-absorptive state (i.e., not actively digesting"
                          " food)."),
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
                      TextSpan(text: "\n\nBMR",style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold ) ),
                      TextSpan(text: " varies between individuals."
                          " One study of 150 adults representative of the population in Scotland "
                          "reported basal metabolic rates from as low as",
                          style: TextStyle(fontSize:16 )),
                      TextSpan(text: " 1027 kcal per day (4301 kJ/day)",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: " to as high as ",style: TextStyle(fontSize:16 )),
                      TextSpan(text: "2499 kcal/day (10455 kJ/day)",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),TextSpan(text: " with a mean BMR of "
                          ,style: TextStyle(fontSize:16 )),
                      TextSpan(text: "1500 kcal/day (6279 kJ/day)",
                          style:TextStyle(fontSize:16.5,fontWeight: FontWeight.bold )),
                      TextSpan(text: ". \n\nDifferences in BMR have been observed when comparing "
                          "subjects with the same lean body mass. In one study, when comparing "
                          "individuals with the same lean body mass, the top 5% of BMRs are"
                          " 1.28–1.32 times the lowest 5% BMR. Additionally, this study "
                          "reports a case where two individuals with the same lean body mass "
                          "of 43 kg had BMRs of 1075 kcal/day (4.5 MJ/day) and 1790 kcal/day "
                          "(7.5 MJ/day). This difference of 715 kcal/day (67%) is equivalent "
                          "to one of the individuals completing a 10 kilometer run every day."
                          " However, this study did not account for the sex, height, fasting-state,"
                          " or body fat percentage of the subjects.",style:TextStyle(fontSize:16 ) ),
                    ]
                )
            ),
          ),
        ),
      ),
    );
  }
}
