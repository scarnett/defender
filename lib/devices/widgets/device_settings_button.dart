import 'package:defender/app/app.dart';
import 'package:defender/app/widgets/app_loder.dart';
import 'package:defender/devices/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

class DeviceSettingsButton extends StatefulWidget {
  const DeviceSettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  _DeviceSettingsButtonState createState() => _DeviceSettingsButtonState();
}

class _DeviceSettingsButtonState extends State<DeviceSettingsButton> {
  bool _pressStatus = false;

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<DeviceSettingsCubit, DeviceSettingsState>(
        buildWhen: (
          DeviceSettingsState previous,
          DeviceSettingsState current,
        ) =>
            previous.status != current.status,
        builder: (
          BuildContext context,
          DeviceSettingsState state,
        ) =>
            Container(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.primaryColor,
              width: 3.0,
            ),
          ),
          child: state.status.isSubmissionInProgress
              ? const AppLoader()
              : Row(
                  children: [
                    Expanded(
                      child: Opacity(
                        opacity: state.status.isValidated ? 1.0 : 0.3,
                        child: Listener(
                          onPointerDown: state.status.isValidated
                              ? (PointerDownEvent details) => setState(() => _pressStatus = true)
                              : null,
                          onPointerUp: state.status.isValidated
                              ? (PointerUpEvent details) => setState(() => _pressStatus = false)
                              : null,
                          child: TextButton(
                            key: const Key('device_settings_button'),
                            onPressed: state.status.isValidated ? () => _tapSave(context) : null,
                            child: Text(
                              AppLocalizations.of(context)!.deviceSettingsSave.toUpperCase(),
                            ),
                            style: _pressStatus ? ButtonStyles.getSimpleTextButtonStyle() : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );

  void _tapSave(
    BuildContext context,
  ) =>
      context.read<DeviceSettingsCubit>().deviceSettingsFormSubmitted(context);
}
