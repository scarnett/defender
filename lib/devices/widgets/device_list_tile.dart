import 'package:cached_network_image/cached_network_image.dart';
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
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: Icon(
                      Icons.settings,
                      color: AppTheme.primaryColor,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            _getCameraPreview(context),
          ],
        ),
      );

  Widget _getCameraPreview(
    BuildContext context,
  ) {
    if (device.cameraPreview.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.borderAccentColor),
              ),
              child: CachedNetworkImage(
                imageUrl: device.cameraPreview,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Text(
                device.lastUpdated.toIso8601String(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      );
    }

    return Container(); // TODO!
  }
}
