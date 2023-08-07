import 'package:flutter/material.dart';
import 'package:your_app_name/constants/colors.dart';

enum Gender {male, female}

class GenderButton extends StatelessWidget {
  const GenderButton({super.key, required this.gender, required this.isActive, required this.onTap});

  final Gender gender;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff1A1F38),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isActive ? AppColors.redColor : Colors.transparent,
          width: 2
        )
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Icon(
              gender == Gender.male ? Icons.male
                  : Icons.female,
              color: isActive ? Colors.white : Colors.grey,
              size: 60,
            ),
            const SizedBox(height: 12),
            Text(
              gender == Gender.male ? "Male" : "Female",
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
