import 'package:flutter/material.dart';
import 'package:water_intake/constants.dart';
import 'package:water_intake/components/icon_content.dart';
import 'package:water_intake/screens/result_page.dart';
import 'package:water_intake/water_brain.dart';
import '../components/reusable_card.dart';
import '../components/round_icon.dart';
import '../components/bottom_button.dart';

enum ActivityLevel { sedentary, light, moderate, active, veryActive }

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int weight = 30;
  int activityLevel = 1;
  int age = 18;
  String get gender => selectedGender == Gender.male ? 'male' : 'female';
  WaterBrain water = WaterBrain(
    gender: 'male',
    age: 18,
    weight: 30,
    activityLevel: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Water Intake Traker"))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    childCard: IconContent(icons: Icons.male, label: "MALE"),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),

                Expanded(
                  child: ReusableCard(
                    childCard: IconContent(
                      icons: Icons.female,
                      label: "FEMALE",
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WEIGHT", style: kTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(weight.toString(), style: kNumberTextStyle),
                      Text("kg", style: kTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: weight.toDouble(),
                      min: 20,
                      max: 300,
                      // divisions: 10,
                      // label: '${weight.toInt()}ml',
                      onChanged: (val) => setState(() => weight = val.toInt()),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    childCard: Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 10.0,
                        vertical: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ACTIVITY LEVEL", style: kTextStyle),
                          Text('$activityLevel', style: kNumberTextStyle),

                          Text(water.getActivityLabel(), style: kTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    if (activityLevel > 0) {
                                      activityLevel--;
                                      water = WaterBrain(
                                        gender: gender,
                                        age: age,
                                        weight: weight,
                                        activityLevel: activityLevel,
                                      );
                                    }
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIcon(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    if (activityLevel < 5) {
                                      activityLevel++;
                                      water = WaterBrain(
                                        gender: gender,
                                        age: age,
                                        weight: weight,
                                        activityLevel: activityLevel,
                                      );
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIcon(
                              icon: Icons.add,
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
          BottomButton(
            ButtomTitle: "CALCULATE",
            onTap: () {
              if (selectedGender == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please select gender first")),
                );
                return;
              }

              WaterBrain water = WaterBrain(
                gender: gender,
                age: age,
                weight: weight,
                activityLevel: activityLevel,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    waterIntake: water.calculateWater(),
                    status: water.getSatuts(),
                    interpretation: water.getAdvice(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
