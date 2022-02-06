import 'package:flutter/cupertino.dart';

class Value extends ChangeNotifier {
  String heading = '';

  void changeHeading(String newString) {
    heading = newString;
    notifyListeners();
  }
}
