import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/models/repository.dart';

class RepoTopInfo extends StatelessWidget {
  final Repository repository;
  const RepoTopInfo({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  repository.owner.avatarUrl,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  repository.owner.login,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              repository.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 16),
            Text(
              repository.description,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset(
                  AppConstants.starIcon,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Text(
                  repository.starCount.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(width: 16),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xff34D058),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  repository.language,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ],
        ),
      );
}
