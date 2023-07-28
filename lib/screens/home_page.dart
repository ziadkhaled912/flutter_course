import 'package:flutter/material.dart';
import 'package:your_app_name/widgets/gender_button.dart';
import 'package:your_app_name/widgets/height_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender _selectedGender = Gender.male;
  int _height = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GenderButton(
                          gender: Gender.male,
                          isActive: _selectedGender == Gender.male,
                          onTap: () {
                            setState(() {
                              _selectedGender = Gender.male;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GenderButton(
                          gender: Gender.female,
                          isActive: _selectedGender == Gender.female,
                          onTap: () {
                            setState(() {
                              _selectedGender = Gender.female;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  HeightCard(
                    onChange: (newValue) {
                      _height = newValue;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
