import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/models/repository.dart';
import 'package:github_repos/screens/search/widgets/searched_item.dart';

class SearchResults extends StatelessWidget {
  final List<Repository> repos;
  const SearchResults({required this.repos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            thickness: 0.2,
            height: 1,
            indent: 20,
            color: Color(0xffE1E4E8),
          ),
          itemCount: repos.length,
          itemBuilder: (context, index) => Searcheditem(repo: repos[index]),
        ),
      );
}
