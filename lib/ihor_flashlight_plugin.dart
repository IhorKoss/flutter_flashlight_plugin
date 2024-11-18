import 'package:torch_light/torch_light.dart';
import 'dart:io' show Platform;

class IhorFlashlightPlugin {
  static bool _isFlashlightOn = false;

  static Future<void> onLight() async {
    try {
      await TorchLight.enableTorch();
      _isFlashlightOn = true;
    } catch (e) {
      print('Помилка при увімкненні ліхтарика: $e');
    }
  }

  static Future<void> offLight() async {
    try {
      await TorchLight.disableTorch();
      _isFlashlightOn = false;
    } catch (e) {
      print('Помилка при вимкненні ліхтарика: $e');
    }
  }

  static bool get isFlashlightOn => _isFlashlightOn;

  static Future<bool> isFlashlightAvailable() async {
    try {
      return await TorchLight.isTorchAvailable();
    } catch (e) {
      print('Помилка перевірки доступності ліхтарика: $e');
      return false;
    }
  }

  static getPlatformVersion () async {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS is not supported';
    } else {
      return 'Unknown';
    }
  }
}
