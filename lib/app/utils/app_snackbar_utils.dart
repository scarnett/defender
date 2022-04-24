import 'package:defender/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppSnackBarUtils {
  const AppSnackBarUtils();

  static show(
    BuildContext context,
    String text,
  ) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(0.0),
          content: AppSnackBar(text: text),
        ),
      );
  }
}
