import 'package:flutter/material.dart';

class DottedContainer extends StatelessWidget {
  const DottedContainer({
    super.key,
    required this.isCorrect,
    required this.enterPin,
    required this.index,
  });

  final bool isCorrect;
  final String enterPin;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isCorrect
            ? (index < enterPin.length
                ? const Color(0xff1CACCC)
                : const Color(0xFFD6D6D6))
            : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
