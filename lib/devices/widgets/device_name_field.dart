import 'package:defender/devices/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceNameField extends StatelessWidget {
  final TextEditingController? nameController;

  const DeviceNameField({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<DeviceSettingsCubit, DeviceSettingsState>(
        builder: (
          BuildContext context,
          DeviceSettingsState state,
        ) =>
            SizedBox(
          height: 80.0,
          child: TextField(
            key: const Key('device_name_field'),
            controller: nameController,
            onChanged: (String name) => context.read<DeviceSettingsCubit>().nameChanged(name),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.name.toUpperCase(),
              errorText: state.name.invalid ? AppLocalizations.of(context)!.required.toUpperCase() : null,
            ),
          ),
        ),
      );
}
