part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class Search extends SearchEvent {
  final String query;

  const Search({required this.query});
}

class SearchMoreRepositories extends SearchEvent {}

class ClearSearch extends SearchEvent {}
