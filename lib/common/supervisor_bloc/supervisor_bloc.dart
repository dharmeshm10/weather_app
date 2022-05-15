import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupervisorBloc extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event ${event.runtimeType} of ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('\n-=-=-=-=-=-=--=-= \n'
        'Transition ${bloc.runtimeType}\n'
        'Current state: ${change.currentState.runtimeType}\n'
        'Next state: ${change.nextState.runtimeType}'
        '\n-=-=-=-=-=-=--=-=');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('\n*********** \n'
        'Bloc created :: ${bloc.runtimeType}'
        '\n***********');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('\n !!!!!!!!-Error-!!!!! \n'
        '${bloc.runtimeType} Errored $error , $stackTrace');
  }
}
