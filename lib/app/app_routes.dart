import 'package:defender/app/app.dart';
import 'package:defender/auth/views/views.dart';
import 'package:defender/home/views/views.dart';
import 'package:flutter/widgets.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeView.page()];

    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
