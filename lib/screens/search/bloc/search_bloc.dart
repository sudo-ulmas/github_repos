import 'package:bloc/bloc.dart';
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
  }

  Future<void> _clearSearch(
      ClearSearch event, Emitter<SearchState> emit) async {
    emit(SearchInitial());
  }

  Future<void> _searchRepos(Search event, Emitter<SearchState> emit) async {
    emit(SearchLoadingResults());
    try {
      final repositories =
          await _repositoryService.searchRepositories(query: event.query);
      if (repositories.isNotEmpty) {
        emit(SearchLoadedWithResults(repositories: repositories));
      } else {
        emit(SearchLoadedEmpty());
      }
    } catch (e) {
      emit(SearchLoadingError(e.toString()));
    }
  }
}
