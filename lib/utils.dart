import 'package:flutter/material.dart';

abstract class Utils {
  static void goTo(BuildContext context, String pathPage) =>
      Navigator.pushNamed<void>(context, pathPage);

static void goToReplace(BuildContext context, String pathPage) =>
      Navigator.pushReplacementNamed<void, void>(context, pathPage);
}
