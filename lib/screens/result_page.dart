import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.bmi});

  final double bmi;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Result:",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xff1A1F38),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _getBmiStatus(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: _getBmiStatusColor(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${_getBmiStatus()} BMI Range:",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getBmiRange(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _getBmiMessage(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBmiStatus() {
    if(widget.bmi > 0 && widget.bmi <= 16) {
      return "Severe thinness";
    } else if (widget.bmi > 16 && widget.bmi <= 17) {
      return "Moderate thinness";
    } else if (widget.bmi > 17 && widget.bmi <= 18.5) {
      return "Mild thinness";
    } else if (widget.bmi > 18.5 && widget.bmi <= 25) {
      return "Normal";
    }  else if (widget.bmi > 25 && widget.bmi <= 30) {
      return "Overweight";
    } else if (widget.bmi > 30 && widget.bmi <= 35) {
      return "Obese Class I";
    } else  {
      return "Obese Class II";
    }
  }

  Color _getBmiStatusColor() {
    if(widget.bmi > 0 && widget.bmi <= 17) {
      return Colors.red;
    } else if (widget.bmi > 17 && widget.bmi <= 18.5) {
      return Colors.yellowAccent;
    } else if (widget.bmi > 18.5 && widget.bmi <= 25) {
      return Colors.green;
    }  else if (widget.bmi > 25 && widget.bmi <= 30) {
      return Colors.yellowAccent;
    }  else if (widget.bmi > 35 ) {
      return Colors.red;
    }
    return Colors.red;
  }

  String _getBmiRange() {
    if(widget.bmi > 0 && widget.bmi <= 16) {
      return "1 - 16 kg/m2";
    } else if (widget.bmi > 16 && widget.bmi <= 17) {
      return "16,1 - 17 kg/m2";
    } else if (widget.bmi > 17 && widget.bmi <= 18.5) {
      return "18 - 18,5 kg/m2";
    } else if (widget.bmi > 18.5 && widget.bmi <= 25) {
      return "18,5 - 25 kg/m2";
    }  else if (widget.bmi > 25 && widget.bmi <= 30) {
      return "25,1 - 30 kg/m2";
    } else if (widget.bmi > 30 && widget.bmi <= 35) {
      return "30,1 - 35 kg/m2";
    } else  {
      return "more than 35 kg/m2";
    }
  }

  String _getBmiMessage() {
    if(widget.bmi > 0 && widget.bmi <= 18.5) {
      return "You should eat more :P";
    } else if (widget.bmi > 18.5 && widget.bmi <= 25) {
      return "You have normal body Good Job!";
    } else  {
      return "you should stop eating :(";
    }
  }
}
