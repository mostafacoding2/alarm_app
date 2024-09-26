import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change: $change');
    // TODO: implement onChange
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose :$bloc');
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate:$bloc');
    // TODO: implement onCreate
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError :$error');
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('onEvent :$event');
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {

    // TODO: implement onTransition
  }

}