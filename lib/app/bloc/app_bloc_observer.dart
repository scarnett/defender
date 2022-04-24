import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  // ignore: unnecessary_overrides
  void onEvent(
    Bloc bloc,
    Object? event,
  ) {
    // print(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  // ignore: unnecessary_overrides
  void onChange(
    BlocBase bloc,
    Change change,
  ) {
    // print(change.toString());
    super.onChange(bloc, change);
  }

  @override
  // ignore: unnecessary_overrides
  void onTransition(
    Bloc bloc,
    Transition transition,
  ) {
    // print(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  // ignore: unnecessary_overrides
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    // print(error);
    // print(stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
