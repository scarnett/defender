import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
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
        onPressed: () => Navigator.pop(context, false),
      );
}
