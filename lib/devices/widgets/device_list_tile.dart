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
      ListTile(
        onTap: onTap,
        title: Text(
          device.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          device.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: onTap == null ? null : const Icon(Icons.chevron_right),
      );
}
