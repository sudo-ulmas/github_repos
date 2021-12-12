import 'package:flutter/material.dart';
import 'package:github_repos/screens/repo/widgets/repo_appbar.dart';

class RepositoryScreen extends StatelessWidget {
  const RepositoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RepoAppbar(),
    );
  }
}
