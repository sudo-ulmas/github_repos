import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
    );
  }
}

class RepositoriesScreen extends StatelessWidget {
  const RepositoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          appBar: SearchAppbar(),
        ),
      );
}

class SearchAppbar extends StatelessWidget with PreferredSizeWidget {
  const SearchAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xffD1D5DA),
            width: 0.12,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 36,
            child: CupertinoTextField(
              keyboardType: TextInputType.visiblePassword,
              cursorColor: AppTheme.primaryTextColor,
              cursorWidth: 2,
              cursorHeight: 20,
              style: Theme.of(context).textTheme.bodyText2,
              placeholder: 'Search GitHub',
              placeholderStyle: Theme.of(context).textTheme.bodyText1,
              prefix: Row(
                children: [
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    AppConstants.searchIcon,
                    width: 24,
                    height: 24,
                    color: AppTheme.textGreyLight,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff2F363D),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
