import 'package:defender/devices/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceCreatePage extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(
        builder: (BuildContext context) => const DeviceCreatePage(),
      );

  const DeviceCreatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.addNewDevice),
        ),
        body: const DeviceQrScanner(),
      );
}
