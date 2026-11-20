import 'package:flutter/material.dart';
import '../widgets/gender_card.dart';
import '../widgets/counter_card.dart';
import '../widgets/bottom_button.dart';
import '../utils/water_calculator.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String selectedGender = '';
  double activityHours = 1.0;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.water_drop, color: Color(0xFF00E5FF)),
            SizedBox(width: 8.0),
            Text('Water Tracker'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                GenderCard(
                  label: 'MALE',
                  icon: Icons.male,
                  isSelected: selectedGender == 'male',
                  onTap: () {
                    setState(() {
                      selectedGender = 'male';
                    });
                  },
                ),
                GenderCard(
                  label: 'FEMALE',
                  icon: Icons.female,
                  isSelected: selectedGender == 'female',
                  onTap: () {
                    setState(() {
                      selectedGender = 'female';
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ACTIVITY (hours/day)',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFFB0BEC5),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '${activityHours.toInt()} h',
                    style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E5FF),
                    ),
                  ),
                  Slider(
                    value: activityHours,
                    min: 0.0,
                    max: 8.0,
                    divisions: 8,
                    activeColor: const Color(0xFF00E5FF),
                    inactiveColor: const Color(0xFF111328),
                    onChanged: (double value) {
                      setState(() {
                        activityHours = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CounterCard(
                  title: 'WEIGHT (kg)',
                  value: weight,
                  onAdd: () {
                    if (weight < 200) {
                      setState(() {
                        weight++;
                      });
                    }
                  },
                  onRemove: () {
                    if (weight > 30) {
                      setState(() {
                        weight--;
                      });
                    }
                  },
                ),
                CounterCard(
                  title: 'AGE (years)',
                  value: age,
                  onAdd: () {
                    if (age < 100) {
                      setState(() {
                        age++;
                      });
                    }
                  },
                  onRemove: () {
                    if (age > 10) {
                      setState(() {
                        age--;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'Calculate Water Intake',
            onPressed: () {
              if (selectedGender == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select your gender first'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              double result = calculateWaterLitres(
                weightKg: weight,
                activityHours: activityHours,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    litres: result,
                    weight: weight,
                    age: age,
                    activityHours: activityHours,
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