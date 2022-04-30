import 'package:defender/signup/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpConfirmPasswordField extends StatelessWidget {
  const SignUpConfirmPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (
          SignUpState previous,
          SignUpState current,
        ) =>
            (previous.password != current.password) || (previous.confirmedPassword != current.confirmedPassword),
        builder: (
          BuildContext context,
          SignUpState state,
        ) =>
            SizedBox(
          height: 80.0,
          child: TextField(
            key: const Key('signup_confirm_password_field'),
            onChanged: (String confirmPassword) =>
                context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword),
            obscureText: true,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.confirmPassword.toUpperCase(),
              errorText:
                  state.confirmedPassword.invalid ? AppLocalizations.of(context)!.matchPassword.toUpperCase() : null,
            ),
          ),
        ),
      );
}
