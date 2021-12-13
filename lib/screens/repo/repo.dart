import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/models/repository.dart';
import 'package:github_repos/screens/issues/issues.dart';
import 'package:github_repos/screens/pull_requests.dart/pull_requests.dart';
import 'package:github_repos/screens/repo/widgets/repo_appbar.dart';
import 'package:github_repos/screens/repo/widgets/repo_top_info.dart';

class RepositoryScreen extends StatelessWidget {
  final Repository repository;
  const RepositoryScreen({Key? key, required this.repository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RepoAppbar(
        title: 'Back',
      ),
      body: Column(
        children: [
          RepoTopInfo(repository: repository),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => IssuesScreen(
                          repository: repository,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff34D058),
                              ),
                              child: SvgPicture.asset(
                                AppConstants.issueIcon,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('Issues'),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.4,
                  height: 1,
                  indent: 20,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const PullRequestsScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2188FF),
                              ),
                              child: SvgPicture.asset(
                                AppConstants.pullRequestIcon,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('Pull Requests'),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
