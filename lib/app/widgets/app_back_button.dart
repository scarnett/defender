import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final VoidCallback? onPressedCallback;

  const BackButton({
    Key? key,
    this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      IconButton(
        icon: const Icon(
          Icons.chevron_left,
          size: 36.0,
        ),
        onPressed: () {
          if (onPressedCallback != null) {
            onPressedCallback!();
          }

          Navigator.of(context).pop();
        },
      );
}
