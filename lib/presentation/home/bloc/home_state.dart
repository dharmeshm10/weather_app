
abstract class HomeState {}

class SearchState extends HomeState {
  bool isSearchEmpty;

  SearchState({
    this.isSearchEmpty = true,
  });
}
