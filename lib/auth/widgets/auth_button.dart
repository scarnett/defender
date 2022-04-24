import 'package:defender/app/app_theme.dart';
import 'package:defender/app/widgets/app_loder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:defender/auth/cubit/cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _pressStatus = false;

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (
          AuthState previous,
          AuthState current,
        ) =>
            (previous.status != current.status),
        builder: (
          BuildContext context,
          AuthState state,
        ) =>
            Container(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.primaryColor,
              width: 3.0,
            ),
          ),
          child: state.status.isSubmissionInProgress
              ? const AppLoader()
              : Row(
                  children: [
                    Expanded(
                      child: Opacity(
                        opacity: state.status.isValidated ? 1.0 : 0.3,
                        child: Listener(
                          onPointerDown: state.status.isValidated
                              ? (PointerDownEvent details) => setState(() => _pressStatus = true)
                              : null,
                          onPointerUp: state.status.isValidated
                              ? (PointerUpEvent details) => setState(() => _pressStatus = false)
                              : null,
                          child: TextButton(
                            key: const Key('login_button'),
                            onPressed: state.status.isValidated ? () async => await _tapAuthenticate(context) : null,
                            child: Text(
                              AppLocalizations.of(context)!.authenticate.toUpperCase(),
                            ),
                            style: _pressStatus ? ButtonStyles.getSimpleTextButtonStyle() : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );

  Future<void> _tapAuthenticate(
    BuildContext context,
  ) async =>
      await context.read<AuthCubit>().logInWithCredentials(context);
}
