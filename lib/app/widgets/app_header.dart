import 'package:defender/app/app.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      Column(
        children: [
          Container(
            child: Text(
              'Defender AI 571-C'.toUpperCase(), // TODO!
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppTheme.primaryColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              'Remote Sentry Weapon System'.toUpperCase(), // TODO!
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            padding: const EdgeInsets.only(bottom: 20.0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.primaryColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      );
}
