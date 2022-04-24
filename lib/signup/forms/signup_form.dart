import 'package:defender/app/utils/app_snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:defender/signup/cubit/cubit.dart';
import 'package:defender/signup/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocListener<SignUpCubit, SignUpState>(
        listener: (
          BuildContext context,
          SignUpState state,
        ) {
          if (state.status.isSubmissionSuccess) {
            Navigator.of(context).pop();
          } else if (state.status.isSubmissionFailure) {
            AppSnackBarUtils.show(context, state.errorMessage ?? AppLocalizations.of(context)!.signUpFailure);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SignUpEmailField(),
              SignUpPasswordField(),
              SignUpConfirmPasswordField(),
              SignUpButton(),
            ],
          ),
        ),
      );
}
