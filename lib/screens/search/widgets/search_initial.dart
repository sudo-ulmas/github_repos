import 'package:flutter/material.dart';

class SearchInital extends StatelessWidget {
  const SearchInital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Find your stuff.',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Text(
            'Search all of GitHub for Repositories',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
