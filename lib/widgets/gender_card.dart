import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1D1E33) : const Color(0xFF111328),
            borderRadius: BorderRadius.circular(12.0),
            border: isSelected
                ? Border.all(color: const Color(0xFF00E5FF), width: 2.0)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60.0,
                color: isSelected ? const Color(0xFF00E5FF) : Colors.white,
              ),
              const SizedBox(height: 10.0),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : const Color(0xFFB0BEC5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}