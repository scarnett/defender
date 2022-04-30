import 'package:defender/auth/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (
          AuthState previous,
          AuthState current,
        ) =>
            (previous.password != current.password),
        builder: (
          BuildContext context,
          AuthState state,
        ) =>
            SizedBox(
          height: 80.0,
          child: TextField(
            key: const Key('login_password_field'),
            onChanged: (String password) => context.read<AuthCubit>().passwordChanged(password),
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
