import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/models/repository.dart';

class Searcheditem extends StatelessWidget {
  final Repository repo;
  const Searcheditem({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  repo.owner.avatarUrl,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(repo.owner.login,
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              repo.name,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 12),
            if (repo.description != '') ...{
              Text(
                repo.description,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 12),
            },
            Row(
              children: [
                SvgPicture.asset(
                  AppConstants.starIcon,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Text(
                  repo.starCount.toString(),
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
                  repo.language,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ],
        ),
      );
}
