import 'package:flutter/material.dart';
import 'package:github_repos/models/repository.dart';
import 'package:github_repos/screens/search/widgets/searched_item.dart';

class SearchResults extends StatelessWidget {
  final List<Repository> repos;
  const SearchResults({required this.repos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.surface,
        child: Scrollbar(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 0.4,
              height: 1,
              indent: 20,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            itemCount: repos.length,
            itemBuilder: (context, index) => Searcheditem(repo: repos[index]),
          ),
        ),
      );
}
