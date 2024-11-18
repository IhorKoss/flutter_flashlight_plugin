import 'package:torch_light/torch_light.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';


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
      print('Помилка: $e');
      return false;
    }
  }

  void getPlatformVersion(BuildContext context) {
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Попередження'),
            content: Text('Функціонал ліхтарика не підтримується на iOS.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (Platform.isAndroid) {
      print('Android');
    } else {
      print('Unknown');
    }
  }
}
