import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:github_repos/models/repository.dart';
import 'package:github_repos/services/repository.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final RepositoryService _repositoryService;
  SearchBloc(this._repositoryService) : super(SearchInitial()) {
    on<Search>(_searchRepos);
    on<ClearSearch>(_clearSearch);
    on<SearchMoreRepositories>(_searchMoreRepositories);
  }

  Future<void> _clearSearch(
      ClearSearch event, Emitter<SearchState> emit) async {
    emit(SearchInitial());
  }

  Future<void> _searchMoreRepositories(
      SearchMoreRepositories event, Emitter<SearchState> emit) async {
    final newState = (state as SearchLoadedWithResults);
    final repositories = List<Repository>.from(newState.repositories);
    emit(newState.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final basePagination = await _repositoryService.searchRepositories(
        query: newState.query,
        page: (repositories.length / 10).ceil() + 1,
      );
      repositories.addAll(basePagination.repositories);
      emit(
        newState.copyWith(
          status: FormzStatus.submissionSuccess,
          repositories: repositories,
        ),
      );
    } catch (e) {
      emit(
        newState.copyWith(
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }

  Future<void> _searchRepos(Search event, Emitter<SearchState> emit) async {
    emit(SearchLoadingResults());
    try {
      final basePagination = await _repositoryService.searchRepositories(
        query: event.query,
        page: 1,
      );
      if (basePagination.repositories.isNotEmpty) {
        emit(
          SearchLoadedWithResults(
            repositories: basePagination.repositories,
            totalCount: basePagination.toalCount,
            query: event.query,
          ),
        );
      } else {
        emit(SearchLoadedEmpty());
      }
    } catch (e) {
      emit(SearchLoadingError(e.toString()));
    }
  }
}
