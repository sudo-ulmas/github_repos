part of 'issues_bloc.dart';

@immutable
abstract class IssuesEvent {}

class GetIssues extends IssuesEvent {
  final String username;
  final String repository;

  GetIssues(this.username, this.repository);
}
