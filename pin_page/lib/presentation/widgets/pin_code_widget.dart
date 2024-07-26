import 'package:flutter/material.dart';
import 'package:pin_page/presentation/widgets/dotted_container.dart';

// ignore: must_be_immutable
class PinCodeWidget extends StatefulWidget {
  bool isCorrect;
  String enterPin;
  PinCodeWidget({
    required this.enterPin,
    required this.isCorrect,
    super.key,
  });

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Text(
              widget.isCorrect
                  ? "Придумайте ПИН-код для входа в приложение"
                  : "ПИН-коды не совпали",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) {
                return DottedContainer(
                  isCorrect: widget.isCorrect,
                  enterPin: widget.enterPin,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
