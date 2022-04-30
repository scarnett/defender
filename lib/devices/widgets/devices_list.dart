import 'package:defender/devices/bloc/devices_bloc.dart';
import 'package:defender/devices/enums/enums.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:defender/devices/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocProvider(
        create: (BuildContext context) => DevicesBloc(
          devicesRepository: context.read<DevicesRepository>(),
        )..add(const DevicesSubscriptionRequested()),
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
            if (state.status == DevicesStatus.loading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status != DevicesStatus.success) {
              return const SizedBox();
            } else {
              return Center(
                child: Text(
                  '0 Devices Found', // TODO!
                  style: Theme.of(context).textTheme.caption,
                ),
              );
            }
          }

          return CupertinoScrollbar(
            child: ListView(
              shrinkWrap: true,
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
