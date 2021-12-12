import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/models/repository.dart';
import 'package:github_repos/screens/repo/repo.dart';

class Searcheditem extends StatefulWidget {
  final Repository repo;
  const Searcheditem({Key? key, required this.repo}) : super(key: key);

  @override
  State<Searcheditem> createState() => _SearcheditemState();
}

class _SearcheditemState extends State<Searcheditem> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onPanDown: (a) => setState(() {
          pressed = true;
        }),
        onPanEnd: (a) => setState(() {
          pressed = false;
        }),
        onPanCancel: () => setState(() {
          pressed = false;
        }),
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => const RepositoryScreen(),
            ),
          );
        },
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: pressed
                        ? Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5)
                        : Colors.transparent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          widget.repo.owner.avatarUrl,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(widget.repo.owner.login,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.repo.name,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 12),
                    if (widget.repo.description != '') ...{
                      Text(
                        widget.repo.description,
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
                          widget.repo.starCount.toString(),
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
                          widget.repo.language,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
