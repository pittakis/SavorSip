import 'package:flutter/material.dart';
import 'package:savorsip/components/color_schemes.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLightMode = true;

  bool get isLightMode => _isLightMode;

  void toggleTheme() {
    _isLightMode = !_isLightMode;
    notifyListeners();
  }

  ThemeData get currentTheme => _isLightMode 
                                ? ThemeData.from(colorScheme: lightColorScheme, useMaterial3: true)
                                : ThemeData.dark().copyWith(colorScheme: darkColorScheme);
}

