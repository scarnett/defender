import 'package:defender/app/app_theme.dart';
import 'package:defender/devices/api/model/model.dart';
import 'package:flutter/material.dart';

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
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.primaryColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
                Container(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Icon(
                    Icons.settings,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
            _getCameraPreview(),
          ],
        ),
      );

  Widget _getCameraPreview() {
    if (device.cameraPreview.isNotEmpty) {
      return FittedBox(
        child: Image.network(
          device.cameraPreview,
        ),
        fit: BoxFit.fill,
      );
    }

    return Container(); // TODO!
  }
}
