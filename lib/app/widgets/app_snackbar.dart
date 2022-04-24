import 'package:defender/app/app.dart';
import 'package:flutter/material.dart';

class AppSnackBar extends StatefulWidget {
  final String text;

  const AppSnackBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<AppSnackBar> createState() => _AppSnackBarState();
}

class _AppSnackBarState extends State<AppSnackBar> {
  @override
  Widget build(
    BuildContext context,
  ) =>
      Container(
        margin: const EdgeInsets.only(top: 2.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppTheme.backgroundColor,
              width: 3.0,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: Text(
            widget.text.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppTheme.fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              letterSpacing: 1.0,
            ),
          ),
        ),
      );
}
