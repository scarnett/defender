import 'package:defender/app/utils/app_snackbar_utils.dart';
import 'package:defender/devices/cubit/cubit.dart';
import 'package:defender/devices/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class DeviceSettingsForm extends StatefulWidget {
  const DeviceSettingsForm({
    Key? key,
  }) : super(key: key);

  @override
  _DeviceSettingsFormState createState() => _DeviceSettingsFormState();
}

class _DeviceSettingsFormState extends State<DeviceSettingsForm> {
  TextEditingController? _nameController;

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocListener<DeviceSettingsCubit, DeviceSettingsState>(
        listener: (
          BuildContext context,
          DeviceSettingsState state,
        ) {
          if (state.status.isSubmissionSuccess) {
            Navigator.of(context).pop();
          } else if (state.status.isSubmissionFailure) {
            AppSnackBarUtils.show(
                context, state.errorMessage ?? AppLocalizations.of(context)!.deviceSettingsSaveFailure);
          }
        },
        child: BlocBuilder<DeviceSettingsCubit, DeviceSettingsState>(
          builder: (
            BuildContext context,
            DeviceSettingsState state,
          ) {
            if ((state.device != null) && (_nameController == null)) {
              _nameController = TextEditingController(text: state.device!.name);
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DeviceNameField(nameController: _nameController),
                  const DeviceSettingsButton(),
                ],
              ),
            );
          },
        ),
      );
}
