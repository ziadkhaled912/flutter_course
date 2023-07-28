import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  const HeightCard({super.key, required this.onChange});

  final void Function(int newValue) onChange;

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  int _height = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff1A1F38),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "Height".toUpperCase(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$_height",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  "cm",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Slider(
              value: _height.toDouble(),
              max: 220,
              min: 80,
              onChanged: (newValue) {
                setState(() {
                  _height = newValue.toInt();
                });
                widget.onChange(_height);
              },
            ),
          ],
        ),
      ),
    );
  }
}
