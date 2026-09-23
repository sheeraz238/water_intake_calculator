import 'package:flutter/material.dart';
//import 'package:water_intake/components/bottom_button.dart';
//import 'package:water_intake/components/constants.dart';

import 'package:water_intake/constants.dart';
import 'package:water_intake/components/reusable_card.dart';
import 'package:water_intake/components/bottom_button.dart';
// import 'package:water_intake/screens/input_page.dart';
// import 'package:water_intake/water_brain.dart';

class ResultPage extends StatelessWidget {
  final String waterIntake;
  final String status;
  final String interpretation;

  ResultPage({
    required this.waterIntake,
    required this.status,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Water Intake Traker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: TextStyle(fontSize: 50.0)),
            ),
          ),

          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              childCard: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text(
                      "$waterIntake ${'liters'.toUpperCase()} ",
                      style: kResultTextStyle,
                    ),
                    Center(child: Text(status, style: TextStyle(fontSize: 30))),
                    Column(
                      children: [
                        Text("Daily Target Progress", style: kTextStyle),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: double.parse(waterIntake) / 4.0,
                            minHeight: 20,
                            backgroundColor: kInactiveCardColor,
                            valueColor: AlwaysStoppedAnimation(kWaterBlue),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kTextStyle,
                    ),

                    // Water level visual!
                  ],
                ),
              ),

              onPress: () {},
            ),
          ),
          BottomButton(
            ButtomTitle: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
