import 'package:flutter/material.dart';
import 'package:pin_page/presentation/widgets/wrap_widget.dart';

void main() {
  runApp(const PinCodePage());
}

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WrapWidget(),
    );
  }
}
