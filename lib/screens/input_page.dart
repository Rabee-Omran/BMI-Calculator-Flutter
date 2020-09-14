import 'package:bmi_calculator/calulator_brain.dart';
import 'package:bmi_calculator/components/resuable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/roundIconBottum.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottmButton.dart';
import '../constans.dart';
import '../components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? activeCardColor
                      : unactiveCardColor,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                cardChild:
                    IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                color: selectedGender == Gender.female
                    ? activeCardColor
                    : unactiveCardColor,
              ))
            ],
          )),
          Expanded(
            child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 230.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                color: activeCardColor),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: numberTextStyle,
                            ),
                            Text(
                              'km',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                    color: activeCardColor),
              ),
              Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                age.toString(),
                                style: numberTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )
                        ],
                      ),
                      color: activeCardColor))
            ],
          )),
          Container(
            child: BottomButtom(
              buttomTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height, weight);

                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText:calc.getResult() ,
                      iterpretation: calc.getInterpretation(),),
                  ),
                );
              },
            ),
            color: bottmContainerColor,
            padding: EdgeInsets.only(bottom: 20.0),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bch,
          )
        ],
      ),
    );
  }
}
