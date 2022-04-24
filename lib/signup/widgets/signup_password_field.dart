import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:defender/signup/cubit/cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({
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
            (previous.password != current.password),
        builder: (
          BuildContext context,
          SignUpState state,
        ) =>
            SizedBox(
          height: 80.0,
          child: TextField(
            key: const Key('signup_password_field'),
            onChanged: (String password) => context.read<SignUpCubit>().passwordChanged(password),
            obscureText: true,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password.toUpperCase(),
              errorText: state.password.invalid ? AppLocalizations.of(context)!.invalidPassword.toUpperCase() : null,
            ),
          ),
        ),
      );
}
