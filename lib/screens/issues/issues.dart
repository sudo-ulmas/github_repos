import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/models/repository.dart';
import 'package:github_repos/screens/repo/widgets/repo_appbar.dart';
import 'package:github_repos/services/repository.dart';

import 'bloc/issues_bloc.dart';

class IssuesScreen extends StatelessWidget {
  final Repository repository;
  const IssuesScreen({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IssuesBloc(RepositoryService()),
      child: Scaffold(
        appBar: RepoAppbar(title: repository.name),
        body: BlocBuilder<IssuesBloc, IssuesState>(
          builder: (context, state) {
            if (state is IssuesInitial) {
              context
                  .read<IssuesBloc>()
                  .add(GetIssues(repository.owner.login, repository.name));
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is IssuesLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is IssuesLoadingError) {
              return const Center(
                child: Text('Loading error'),
              );
            } else if (state is IssuesLoaded) {
              return Container(
                color: Theme.of(context).colorScheme.surface,
                child: Scrollbar(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 0.4,
                      height: 1,
                      indent: 20,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                    itemCount: state.issues.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.issues[index].number.toString(),
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 12),
                          Text(
                            state.issues[index].title,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
