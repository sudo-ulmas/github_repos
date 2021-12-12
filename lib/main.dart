import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/core/singletons/service_locator.dart';
import 'package:github_repos/core/theme.dart';
import 'package:github_repos/screens/search/search.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repos',
      home: const SearchScreen(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
    );
  }
}
