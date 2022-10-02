import 'package:defender/devices/bloc/devices_bloc.dart';
import 'package:defender/devices/enums/enums.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:defender/devices/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => DevicesBloc(
              devicesRepository: context.read<DevicesRepository>(),
            )..add(const DevicesSubscriptionRequested()),
          ),
        ],
        child: const DevicesView(),
      );
}

class DevicesView extends StatelessWidget {
  const DevicesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<DevicesBloc, DevicesState>(
        builder: (
          BuildContext context,
          DevicesState state,
        ) {
          if (state.devices.isEmpty) {
            switch (state.status) {
              case DevicesStatus.loading:
                return const Center(child: CupertinoActivityIndicator());

              case DevicesStatus.success:
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.devicesNone,
                    style: Theme.of(context).textTheme.caption,
                  ),
                );

              case DevicesStatus.initial:
              case DevicesStatus.failure:
              default:
                return const SizedBox();
            }
          }

          return CupertinoScrollbar(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                for (final device in state.devices)
                  DeviceListTile(
                    device: device,
                    onTap: () => {}, // TODO!
                  ),
              ],
            ),
          );
        },
      );
}
