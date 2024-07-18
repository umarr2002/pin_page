import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  String pinCode = "2002";

  String enterPin = "";
  int count = 0;
  bool isCorrect = true;

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
          _vibrateOnError();
        }
      }
    });
  }

  Future<void> _vibrateOnError() async {
    if (await Vibration.hasCustomVibrationsSupport() ?? false) {
      Vibration.vibrate(duration: 50, amplitude: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 241, 255),
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          backgroundColor: const Color.fromARGB(255, 220, 241, 255),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      isCorrect
                          ? "Придумайте ПИН-код для входа в приложение"
                          : "ПИН-коды не совпали",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.all(6.0),
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: isCorrect
                                  ? (index < enterPin.length
                                      ? const Color.fromARGB(255, 102, 124, 223)
                                      : Colors.grey)
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(9, (index) {
                        return GestureDetector(
                            onTap: () {
                              buttonFunc((index + 1).toString());
                            },
                            child: Container(
                              width: 80,
                              height: 78,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(fontSize: 29),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ));
                      }),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    buttonFunc("0");
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 78,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: const Center(
                                      child: Text(
                                        "0",
                                        style: TextStyle(fontSize: 29),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  buttonFunc("delete");
                                },
                                child: Container(
                                  width: 80,
                                  height: 78,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 220, 241, 255)),
                                  child: const Center(
                                      child: Icon(Icons.backspace)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isCorrect && count == pinCode.length)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue,
                            ),
                            height: 52,
                            width: 350,
                            child: const Center(
                              child: Text(
                                "Продолжить",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const PinCodePage());
}
