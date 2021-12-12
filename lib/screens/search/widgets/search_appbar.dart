import 'package:flutter/material.dart';
import 'package:github_repos/screens/search/widgets/search_textfield.dart';

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
          SearchTextField(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
