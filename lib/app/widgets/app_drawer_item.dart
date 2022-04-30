import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;

  const AppDrawerItem({
    Key? key,
    required this.text,
    this.textStyle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      ListTile(
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: textStyle ?? Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        ),
        onTap: onTap,
      );
}
