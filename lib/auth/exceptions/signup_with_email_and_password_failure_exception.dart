import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(
    BuildContext context,
    String code,
  ) {
    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.signUpInvalidEmail,
        );

      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.signUpUserDisabled,
        );

      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.signUpEmailInUse,
        );

      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.operationNotAllowed,
        );

      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.weakPassword,
        );

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
