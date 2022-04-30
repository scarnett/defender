import 'package:defender/app/widgets/widgets.dart';
import 'package:defender/devices/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static Page page() => const MaterialPage<void>(child: HomeView());

  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(
    BuildContext context,
  ) =>
      Scaffold(
        body: _buildContent(),
        drawer: const AppDrawer(),
        extendBody: true,
        extendBodyBehindAppBar: true,
      );

  Widget _buildContent() => SafeArea(
        child: Column(
          children: const [
            DevicesList(),
          ],
        ),
      );
}
