import 'package:defender/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:defender/auth/auth.dart';
import 'package:defender/auth/cubit/cubit.dart';
import 'package:defender/auth/forms/forms.dart';

class LoginPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: LoginPage());

  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocProvider(
            create: (BuildContext context) => AuthCubit(context.read<AuthenticationRepository>()),
            child: Column(
              children: const [
                AppHeader(),
                SizedBox(height: 20.0),
                AuthForm(),
              ],
            ),
          ),
        ),
      );
}
