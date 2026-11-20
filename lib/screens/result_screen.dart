import 'package:flutter/material.dart';
import '../utils/water_calculator.dart';
import '../widgets/bottom_button.dart';

class ResultScreen extends StatelessWidget {
  final double litres;
  final int weight;
  final int age;
  final double activityHours;

  const ResultScreen({
    super.key,
    required this.litres,
    required this.weight,
    required this.age,
    required this.activityHours,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Your Daily Water Intake',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.water_drop,
                    size: 60.0,
                    color: Color(0xFF00E5FF),
                  ),
                  Text(
                    '${litres.toStringAsFixed(2)} L / Day',
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E5FF),
                    ),
                  ),
                  const Text(
                    'Estimated value (educational formula)\nNot medical advice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFB0BEC5),
                    ),
                  ),
                  Text(
                    getGuidanceText(litres),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(color: Colors.white24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Weight: $weight kg',
                        style: const TextStyle(color: Color(0xFFB0BEC5)),
                      ),
                      Text(
                        'Age: $age years',
                        style: const TextStyle(color: Color(0xFFB0BEC5)),
                      ),
                      Text(
                        'Activity: ${activityHours.toInt()} h',
                        style: const TextStyle(color: Color(0xFFB0BEC5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'Re-calculate',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}