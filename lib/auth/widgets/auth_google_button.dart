import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:defender/auth/cubit/cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      ElevatedButton.icon(
        key: const Key('login_google_button'),
        label: Text(
          AppLocalizations.of(context)!.googleSignin.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        icon: Image.asset(
          'assets/logos/google.png',
          height: 20.0,
        ),
        onPressed: () => _tapLogin(context),
      );

  void _tapLogin(
    BuildContext context,
  ) =>
      context.read<AuthCubit>().logInWithGoogle(context);
}
