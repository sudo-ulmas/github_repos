import 'package:flutter/material.dart';

class SearchError extends StatelessWidget {
  final String errorMessage;
  const SearchError({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: Center(
          child: Text(
            errorMessage,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      );
}
