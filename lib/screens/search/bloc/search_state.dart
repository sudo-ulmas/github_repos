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
  final String query;
  final int totalCount;
  final FormzStatus status;

  SearchLoadedWithResults({
    required this.repositories,
    required this.totalCount,
    required this.query,
    this.status = FormzStatus.pure,
  });

  SearchLoadedWithResults copyWith({
    List<Repository>? repositories,
    int? totalCount,
    FormzStatus? status,
    String? query,
  }) {
    return SearchLoadedWithResults(
      repositories: repositories ?? this.repositories,
      totalCount: totalCount ?? this.totalCount,
      status: status ?? this.status,
      query: query ?? this.query,
    );
  }
}

class SearchLoadedEmpty extends SearchState {}
