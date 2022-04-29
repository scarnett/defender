import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogInWithGoogleFailure implements Exception {
  final String message;

  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred',
  ]);

  factory LogInWithGoogleFailure.fromCode(
    BuildContext context,
    String code,
  ) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleDifferentCreds,
        );

      case 'invalid-credential':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleInvalidCreds,
        );

      case 'operation-not-allowed':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleOperationNotAllowed,
        );

      case 'user-disabled':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleUserDisabled,
        );

      case 'user-not-found':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleUserNotFound,
        );

      case 'wrong-password':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleWrongPassword,
        );

      case 'invalid-verification-code':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleInvalidVerificationCode,
        );

      case 'invalid-verification-id':
        return LogInWithGoogleFailure(
          AppLocalizations.of(context)!.loginGoogleInvalidVerificationId,
        );

      default:
        return const LogInWithGoogleFailure();
    }
  }
}
