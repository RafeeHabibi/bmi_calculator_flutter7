import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int maleCardColor = kInactiveColor;
int femaleCardColor = kInactiveColor;

void changeColor(GenderType gender) {
  if (gender == GenderType.male) {
    if (maleCardColor == kInactiveColor) {
      maleCardColor = kActivityColor;
      femaleCardColor = kInactiveColor;
    } else {
      maleCardColor = kInactiveColor;
    }
  } else if (gender == GenderType.female) {
    if (femaleCardColor == kInactiveColor) {
      maleCardColor = kInactiveColor;
      femaleCardColor = kActivityColor;
    } else {
      femaleCardColor = kInactiveColor;
    }
  }
}

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 120;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(kActivityColor),
        ),
        body: Expanded(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              changeColor(GenderType.male);
                            });
                          },
                          child: ReusableCard(
                            color: Color(maleCardColor),
                            child: IconContent(
                              icon: FontAwesomeIcons.mars,
                              label: 'Male',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              changeColor(GenderType.female);
                            });
                          },
                          child: ReusableCard(
                            color: Color(femaleCardColor),
                            child: IconContent(
                              icon: FontAwesomeIcons.venus,
                              label: 'Female',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'HIGHT',
                                style: KLableTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    height.toString(),
                                    style: kValueTextStyle,
                                  ),
                                  Text(
                                    'cm',
                                    style: KLableTextStyle,
                                  ),
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 14),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 28),
                                  thumbColor: Color(0xFFEB1555),
                                  overlayColor: Color(0x15EB1555),
                                  inactiveTrackColor: Color(0xFF9D8E98),
                                  activeTrackColor: Colors.white,
                                  trackHeight: 1,
                                ),
                                child: Slider(
                                  value: height.toDouble(),
                                  min: 100,
                                  max: 220,
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: KLableTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kValueTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.add,
                                    onPress: () {
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
                        child: ReusableCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: KLableTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kValueTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.add,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: BottomButton(
                    bottomText: 'CALCULATE',
                    onTap: () {
                      Calculator calculator = Calculator(weight: weight, height: height);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                              bmiResult : calculator.CalculateBMI(),
                              resultText : calculator.getResult(),
                              interpretation : calculator.getInterpretation(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
