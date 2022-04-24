import 'package:defender/app/bloc/bloc.dart';
import 'package:defender/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: BlocProvider(
          create: (BuildContext context) => AppBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
          child: _buildContent(),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
      );

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.only(top: 40.0),
      child: TextButton(
        child: const Text('LOGOUT'),
        onPressed: () => _tapLogout(context),
      ),
    );
  }

  void _tapLogout(
    BuildContext context,
  ) =>
      context.read<AppBloc>().add(AppLogoutRequested());
}
