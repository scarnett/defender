import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogInWithEmailAndPasswordFailure implements Exception {
  final String message;

  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(
    BuildContext context,
    String code,
  ) {
    switch (code) {
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.loginInvalidEmail,
        );

      case 'user-disabled':
        return LogInWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.loginUserDisabled,
        );

      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.loginUserNotFound,
        );

      case 'wrong-password':
        return LogInWithEmailAndPasswordFailure(
          AppLocalizations.of(context)!.loginWrongPassword,
        );

      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
