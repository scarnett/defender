import 'package:defender/app/app_theme.dart';
import 'package:defender/app/bloc/bloc.dart';
import 'package:defender/app/widgets/app_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  final Widget? child;

  const AppDrawer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      Drawer(
        backgroundColor: AppTheme.backgroundColor,
        child: child ?? const AppDrawerInner(),
      );
}

class AppDrawerInner extends StatelessWidget {
  const AppDrawerInner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<AppBloc, AppState>(
        builder: (
          BuildContext context,
          AppState state,
        ) =>
            SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    AppDrawerItem(
                      key: const Key('signout_button'),
                      text: AppLocalizations.of(context)!.signOut.toUpperCase(),
                      onTap: () => _tapLogout(context),
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  AppDrawerItem(
                    text: AppLocalizations.of(context)!.version(state.packageInfo?['version'] ?? '').toUpperCase(),
                    textStyle: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      );

  void _tapLogout(
    BuildContext context,
  ) =>
      context.read<AppBloc>().add(AppLogoutRequested());
}
