import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/home/bloc/home_state.dart';

class HomeCubit extends Cubit<SearchState> {
  HomeCubit() : super(SearchState());

  void validationEmpty() => emit(
        SearchState(
          isSearchEmpty: false,
        ),
      );
}
