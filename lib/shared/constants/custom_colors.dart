import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 27, 255, 31);
  Color _activeSecondaryButton = Color.fromARGB(255, 100, 200, 200);
  Color _gradientMainColor = Color(0xff00ADFA);
  Color _gradientSecColor = Color(0xff00E6FD);
  Color _appBarMainColor = Color(0xff0A6D92);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButton() {
    return _activeSecondaryButton;
  }

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecondaryColor() {
    return _gradientSecColor;
  }

  Color getAppBarMainColor() {
    return _appBarMainColor;
  }
}
