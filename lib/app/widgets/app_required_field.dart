import 'package:defender/app/enums/enums.dart';
import 'package:formz/formz.dart';

class AppRequiredField extends FormzInput<String, AppFieldValidationError> {
  const AppRequiredField.pure() : super.pure('');

  const AppRequiredField.dirty([
    String value = '',
  ]) : super.dirty(value);

  @override
  AppFieldValidationError? validator(
    String value,
  ) =>
      value.isNotEmpty ? null : AppFieldValidationError.invalid;
}
