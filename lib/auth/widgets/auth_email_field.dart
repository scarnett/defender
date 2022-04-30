import 'package:defender/auth/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthEmailField extends StatelessWidget {
  const AuthEmailField({
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
            (previous.email != current.email),
        builder: (
          BuildContext context,
          AuthState state,
        ) =>
            SizedBox(
          height: 80.0,
          child: TextField(
            key: const Key('login_email_field'),
            onChanged: (String email) => context.read<AuthCubit>().emailChanged(email),
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email.toUpperCase(),
              helperText: null,
              errorText: state.email.invalid ? AppLocalizations.of(context)!.invalidEmail.toUpperCase() : null,
            ),
          ),
        ),
      );
}
