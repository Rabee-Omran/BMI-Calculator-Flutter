import 'package:bmi_calculator/components/bottmButton.dart';
import 'package:bmi_calculator/constans.dart';
import 'package:bmi_calculator/components/resuable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding:EdgeInsets.all(15.0) ,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: titleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'data',
                    style: resultTextStyle,
                  ),
                  Text(
                    '16',
                    style: mitTextStyle,
                  ),
                  Text(
                    'Your',
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  
                 
                ],

              ),
            ),
          ),
            Container(
            child: BottomButtom(
                    buttomTitle: 'RE-CALCULATE',
                    onTap: () {
                      Navigator.pop(context);
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
