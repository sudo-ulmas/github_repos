part of 'issues_bloc.dart';

@immutable
abstract class IssuesState {}

class IssuesInitial extends IssuesState {}

class IssuesLoading extends IssuesState {}

class IssuesLoaded extends IssuesState {
  final List<Issue> issues;

  IssuesLoaded(this.issues);
}

class IssuesLoadingError extends IssuesState {}
