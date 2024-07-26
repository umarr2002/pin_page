import 'package:vibration/vibration.dart';

class Functions {  
  Functions();
  Future<void> vibrateOnError() async {
    if (await Vibration.hasCustomVibrationsSupport() ?? false) {
      Vibration.vibrate(duration: 50, amplitude: 1);
    }
  }
}
