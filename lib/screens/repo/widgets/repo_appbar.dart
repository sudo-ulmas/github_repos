import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repos/core/constants.dart';

class RepoAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const RepoAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      height: kToolbarHeight + 40,
      color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppConstants.chevronLeftIcon,
              width: 40,
              height: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
