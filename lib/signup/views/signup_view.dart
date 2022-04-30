import 'package:defender/app/widgets/app_header.dart';
import 'package:defender/auth/auth.dart';
import 'package:defender/signup/cubit/cubit.dart';
import 'package:defender/signup/forms/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  static Route route() => MaterialPageRoute<void>(
        builder: (BuildContext context) => const SignupView(),
      );

  const SignupView({
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
            create: (BuildContext context) => SignUpCubit(context.read<AuthenticationRepository>()),
            child: Column(
              children: const [
                AppHeader(),
                SizedBox(height: 20.0),
                SignUpForm(),
              ],
            ),
          ),
        ),
      );
}
