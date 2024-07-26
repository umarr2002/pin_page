import 'package:flutter/material.dart';
import 'package:pin_page/presentation/functions/functions.dart';
import 'package:pin_page/presentation/variables/variable.dart';
import 'package:pin_page/presentation/widgets/number_container.dart';
import 'package:pin_page/presentation/widgets/pin_code_widget.dart';

class WrapWidget extends StatefulWidget {
  const WrapWidget({super.key});

  @override
  State<WrapWidget> createState() => WrapWidgetState();
}

class WrapWidgetState extends State<WrapWidget> {
  Future<void> buttonFunc(String value) async {
    setState(() {
      if (value == "delete") {
        if (enterPin.isNotEmpty) {
          enterPin = enterPin.substring(0, enterPin.length - 1);
          count--;
        } else if (!isCorrect) {
          setState(() {
            isCorrect = true;
          });
        }
      } else if (enterPin.length <= 3 && isCorrect) {
        enterPin += value;
        count++;
      }

      if (count == pinCode.length) {
        if (enterPin != pinCode) {
          isCorrect = false;
          enterPin = "";
          count = 0;
          Functions().vibrateOnError();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffF0F2F5),
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          backgroundColor: const Color(0xffF0F2F5),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                PinCodeWidget(
                  enterPin: enterPin,
                  isCorrect: isCorrect,
                ),
                WrapCustomWidget(
                  widget: List.generate(
                    9,
                    (index) {
                      return NumberContainer(
                        index: (index + 1).toString(),
                        onTap: () {
                          buttonFunc((index + 1).toString());
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                WrapCustomWidget(
                  widget: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 80,
                            height: 78,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: NumberContainer(
                              index: '0',
                              onTap: () {
                                buttonFunc("0");
                              },
                            ),
                          ),
                          NumberContainer(
                            icon: const Icon(
                              Icons.backspace,
                            ),
                            color: Colors.transparent,
                            onTap: () {
                              buttonFunc("delete");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isCorrect && count == pinCode.length)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28, top: 25),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                        ),
                        height: 52,
                        width: 358,
                        child: const Center(
                          child: Text(
                            "Продолжить",
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WrapCustomWidget extends StatefulWidget {
  List<Widget> widget;
  WrapCustomWidget({required this.widget, super.key});

  @override
  State<WrapCustomWidget> createState() => _WrapCustomWidgetState();
}

class _WrapCustomWidgetState extends State<WrapCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        alignment: WrapAlignment.center,
        children: widget.widget,
      ),
    );
  }
}
