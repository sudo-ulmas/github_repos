import 'package:bloc/bloc.dart';
import 'package:github_repos/models/issue.dart';
import 'package:github_repos/services/repository.dart';
import 'package:meta/meta.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final RepositoryService _repositoryService;
  IssuesBloc(this._repositoryService) : super(IssuesInitial()) {
    on<GetIssues>(_getIssues);
  }
  Future<void> _getIssues(GetIssues event, Emitter<IssuesState> emit) async {
    emit(IssuesLoading());
    try {
      final issues = await _repositoryService.getIssues(
          username: event.username, repository: event.repository);
      emit(IssuesLoaded(issues));
    } catch (e) {
      print(e.toString());
      emit(IssuesLoadingError());
    }
  }
}
