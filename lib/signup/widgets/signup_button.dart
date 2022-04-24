import 'package:defender/app/app.dart';
import 'package:defender/app/widgets/app_loder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:defender/signup/cubit/cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  bool _pressStatus = false;

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (
          SignUpState previous,
          SignUpState current,
        ) =>
            previous.status != current.status,
        builder: (
          BuildContext context,
          SignUpState state,
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
                            key: const Key('signup_button'),
                            onPressed: state.status.isValidated ? () => _tapSignUp(context) : null,
                            child: Text(
                              AppLocalizations.of(context)!.createAccount.toUpperCase(),
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

  void _tapSignUp(
    BuildContext context,
  ) =>
      context.read<SignUpCubit>().signUpFormSubmitted(context);
}
