import 'package:flutter/material.dart';
import 'package:your_app_name/widgets/common_circle_icon_button.dart';

class CommonBodyInfoCard extends StatefulWidget {
  const CommonBodyInfoCard({
    super.key,
    required this.title,
    required this.onChange,
    this.initialValue,
  });

  final int? initialValue;
  final String title;
  final void Function(int value) onChange;

  @override
  State<CommonBodyInfoCard> createState() => _CommonBodyInfoCardState();
}

class _CommonBodyInfoCardState extends State<CommonBodyInfoCard> {
  late int _value;
  
  @override
  void initState() {
    _value = widget.initialValue ?? 20;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff1A1F38),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "$_value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              CommonCircularIconButton(
                icon: Icons.remove,
                onPressed: () {
                  if(_value > 1) {
                    setState(() {
                    _value--;
                  });
                    widget.onChange(_value);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
                      "You Can't add negative value",
                    )));
                  }
                },
              ),
              const Spacer(),
              CommonCircularIconButton(
                icon: Icons.add,
                onPressed: () {
                  setState(() {
                    _value++;
                  });
                  widget.onChange(_value);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
