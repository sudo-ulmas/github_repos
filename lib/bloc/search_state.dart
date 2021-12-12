part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingResults extends SearchState {}

class SearchLoadingError extends SearchState {
  final String errorMessage;

  SearchLoadingError(this.errorMessage);
}

class SearchLoadedWithResults extends SearchState {
  final List<Repository> repositories;

  SearchLoadedWithResults({required this.repositories});
}

class SearchLoadedEmpty extends SearchState {}
