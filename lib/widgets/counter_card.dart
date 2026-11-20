import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CounterCard({
    super.key,
    required this.title,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                color: Color(0xFFB0BEC5),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF111328),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onRemove,
                    icon: const Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 15.0),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF111328),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onAdd,
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}