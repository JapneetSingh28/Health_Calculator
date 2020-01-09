import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_calculator/constants.dart';
import 'package:health_calculator/screens/bmi_inputpage.dart';
import 'package:health_calculator/screens/bmr_inputpage.dart';
import 'package:health_calculator/screens/body_fat_inputpage.dart';
import 'package:health_calculator/screens/caloric_inputpage.dart';
import 'package:health_calculator/screens/ideal_weight_inputpage.dart';
import 'package:health_calculator/screens/water_intake_inputpage.dart';

enum Type {
  BMI,
  BMR,
  CALORIC_NEEDS,
  WATER_INTAKE,
  IDEAL_WEIGHT,
  BODY_FAT,
}

Type selectedType;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double iconSize = 90.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('HEALTH CALCULATOR'),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = Type.BMI;
                          Timer(
                              Duration(milliseconds: 100),
                              () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BmiInputPage()),
                                  ));
                        });
                      },
                      child: Card(
                        color: selectedType == Type.BMI
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.cloudscale,
                              size: iconSize,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'BMI',
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
                          selectedType = Type.BMR;
                          Timer(
                              Duration(milliseconds: 100),
                              () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BmrInputPage()),
                                  ));
                        });
                      },
                      child: Card(
                        color: selectedType == Type.BMR
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.balanceScale,
                              size: iconSize,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'BMR',
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = Type.CALORIC_NEEDS;
                          Timer(
                              Duration(milliseconds: 100),
                              () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CaloricInputPage()),
                                  ));
                        });
                      },
                      child: Card(
                        color: selectedType == Type.CALORIC_NEEDS
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.appleAlt,
                              size: iconSize,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Caloric Needs',
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
                          selectedType = Type.WATER_INTAKE;
                          Timer(
                              Duration(milliseconds: 100),
                              () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WaterIntakeInputPage()),
                                  ));
                        });
                      },
                      child: Card(
                        color: selectedType == Type.WATER_INTAKE
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.wineGlassAlt,
                              size: iconSize,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Water Intake',
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = Type.IDEAL_WEIGHT;
                          Timer(
                              Duration(milliseconds: 100),
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        IdealWeightInputPage()),
                              ));
                        });
                      },
                      child: Card(
                        color: selectedType == Type.IDEAL_WEIGHT
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.weight,
                              size: iconSize,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Ideal Weight',
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
                          selectedType = Type.BODY_FAT;
                          Timer(
                              Duration(milliseconds: 100),
                                  () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BodyFatInputPage()),
                              ));
                        });
                      },
                      child: Card(
                        color: selectedType == Type.BODY_FAT
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.user,
                              size: iconSize,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Body Fat %',
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
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Do you really want to exit?",
                style: TextStyle(fontFamily: 'OpenSansRegular', fontSize: 18.5),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "No",
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text(
                    "Yes",
                  ),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }
}
