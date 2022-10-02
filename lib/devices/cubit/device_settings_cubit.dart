import 'package:defender/app/utils/utils.dart';
import 'package:defender/app/widgets/widgets.dart';
import 'package:defender/devices/api/model/model.dart';
import 'package:defender/devices/exceptions/exceptions.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_settings_cubit.g.dart';
part 'device_settings_state.dart';

class DeviceSettingsCubit extends HydratedCubit<DeviceSettingsState> {
  final DevicesRepository _devicesRepository;

  DeviceSettingsCubit({
    required DevicesRepository devicesRepository,
  })  : _devicesRepository = devicesRepository,
        super(const DeviceSettingsState());

  void setDevice(
    Device device,
  ) =>
      emit(state.copyWith(device: Nullable<Device?>(device)));

  void clearDevice() => emit(state.copyWith(device: Nullable<Device?>(null)));

  void nameChanged(
    String value,
  ) {
    final AppRequiredField name = AppRequiredField.dirty(value);

    emit(
      state.copyWith(
        device: Nullable<Device?>(state.device!.copyWith(name: name.value)),
        name: name,
        status: Formz.validate([name]),
      ),
    );
  }

  Future<void> deviceSettingsFormSubmitted(
    BuildContext context,
  ) async {
    if (!state.status.isValidated) {
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _devicesRepository.save(state.device!);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on SaveDeviceSettingsException catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  @override
  DeviceSettingsState fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DeviceSettingsStateFromJson(json);

  @override
  Map<String, dynamic> toJson(
    DeviceSettingsState state,
  ) =>
      _$DeviceSettingsStateToJson(state);
}
