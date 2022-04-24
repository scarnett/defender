import 'package:defender/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:defender/signup/views/views.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthSignUpButton extends StatelessWidget {
  const AuthSignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      Row(
        children: [
          Expanded(
            child: TextButton(
              key: const Key('login_signup_button'),
              onPressed: () => _tapCreate(context),
              child: Text(AppLocalizations.of(context)!.createAccount.toUpperCase()),
              style: ButtonStyles.getSimpleTextButtonStyle(),
            ),
          ),
        ],
      );

  void _tapCreate(
    BuildContext context,
  ) =>
      Navigator.of(context).push<void>(SignupView.route());
}
