import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CupertinoActivityIndicator(),
      );
}
