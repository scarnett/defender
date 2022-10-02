import 'package:defender/app/app_theme.dart';
import 'package:defender/devices/api/model/model.dart';
import 'package:defender/devices/cubit/cubit.dart';
import 'package:defender/devices/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceListTile extends StatelessWidget {
  final Device device;
  final VoidCallback? onTap;

  const DeviceListTile({
    Key? key,
    required this.device,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.primaryColor),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      device.name.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(letterSpacing: 1.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                BlocBuilder<DeviceSettingsCubit, DeviceSettingsState>(
                  builder: (
                    BuildContext context,
                    DeviceSettingsState state,
                  ) =>
                      Container(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: AppTheme.primaryColor,
                        size: 20.0,
                      ),
                      splashRadius: 20.0,
                      onPressed: () => _tapSettings(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  // Widget _getCameraPreview(
  //   BuildContext context,
  // ) {
  //   if (device.cameraPreview.isNotEmpty) {
  //     return Container(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Stack(
  //         children: [
  //           Container(
  //             decoration: BoxDecoration(
  //               border: Border.all(color: AppTheme.borderAccentColor),
  //             ),
  //             child: CachedNetworkImage(
  //               imageUrl: device.cameraPreview,
  //               fit: BoxFit.fill,
  //             ),
  //           ),
  //           Positioned(
  //             bottom: 10.0,
  //             left: 10.0,
  //             child: Text(
  //               device.lastUpdated.toIso8601String(),
  //               style: Theme.of(context).textTheme.displaySmall,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   return Container(); // TODO!
  // }

  _tapSettings(
    BuildContext context,
  ) {
    context.read<DeviceSettingsCubit>().setDevice(device);
    Navigator.of(context).push(DeviceSettingsPage.route());
  }
}
