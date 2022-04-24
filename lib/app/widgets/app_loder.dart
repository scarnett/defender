import 'package:defender/app/app_theme.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final Color? color;

  const AppLoader({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 28.0,
            height: 28.0,
            child: CircularProgressIndicator(
              color: color ?? AppTheme.primaryColor,
            ),
          ),
        ),
      );
}
