import 'package:defender/app/widgets/widgets.dart' as app_widgets;
import 'package:defender/devices/cubit/device_settings_cubit.dart';
import 'package:defender/devices/forms/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceSettingsPage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(
        builder: (BuildContext context) => const DeviceSettingsPage(),
      );

  const DeviceSettingsPage({
    Key? key,
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
            Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.deviceSettings),
            leading: app_widgets.BackButton(
              onPressedCallback: () => context.read<DeviceSettingsCubit>().clearDevice(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: const [
                DeviceSettingsForm(),
              ],
            ),
          ),
        ),
      );
}
