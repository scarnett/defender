import 'package:defender/app/utils/app_snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:defender/auth/cubit/cubit.dart';
import 'package:defender/auth/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocListener<AuthCubit, AuthState>(
        listener: (
          BuildContext context,
          AuthState state,
        ) {
          if (state.status.isSubmissionFailure) {
            AppSnackBarUtils.show(context, AppLocalizations.of(context)!.authFailure);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              AuthEmailField(),
              LoginPasswordField(),
              LoginButton(),
              AuthSignUpButton(),
            ],
          ),
        ),
      );
}
