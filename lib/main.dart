import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repos',
      home: const RepositoriesScreen(),
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(),
    );
  }
}

class RepositoriesScreen extends StatelessWidget {
  const RepositoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppbar(),
    );
  }
}

class SearchAppbar extends StatelessWidget with PreferredSizeWidget {
  const SearchAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 36,
            child: CupertinoTextField(
              keyboardType: TextInputType.visiblePassword,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 14,
                  ),
              placeholder: 'Search GitHub',
              placeholderStyle: Theme.of(context).textTheme.bodyText1,
              prefix: Row(
                children: [
                  const SizedBox(width: 8),
                  SvgPicture.asset(AppConstants.searchIcon),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff444D56),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
