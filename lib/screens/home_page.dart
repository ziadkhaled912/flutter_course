import 'package:flutter/material.dart';
import 'package:your_app_name/constants/colors.dart';
import 'package:your_app_name/screens/result_page.dart';
import 'package:your_app_name/widgets/common_body_info_card.dart';
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
  int _selectedWeight = 50;
  int _selectedAge = 16;

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
                  const SizedBox(height: 32),
                  HeightCard(
                    onChange: (newValue) {
                      _height = newValue;
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                          child: CommonBodyInfoCard(
                        title: "Weight".toUpperCase(),
                        onChange: (newValue) {
                          _selectedWeight = newValue;
                        },
                            initialValue: 40,
                      )),
                      const SizedBox(width: 8),
                      Expanded(
                          child: CommonBodyInfoCard(
                            title: "Age".toUpperCase(),
                            onChange: (newValue) {
                              _selectedAge = newValue;
                            },
                            initialValue: 16,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                final result = _calculateBMI();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultPage(bmi: result,)));
              },
              color: AppColors.redColor,
              height: 100,
              child: const SafeArea(
                top: false,
                child: Text(
                  "Calculate Your BMI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateBMI() {
    final heightPerMeter = _height / 100;
    final bmi = _selectedWeight / (heightPerMeter * heightPerMeter);
    return bmi;
  }
}
