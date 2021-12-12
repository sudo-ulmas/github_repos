import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/core/theme.dart';
import 'package:github_repos/screens/search/bloc/search_bloc.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({Key? key}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 36,
        child: CupertinoTextField(
          autofocus: true,
          controller: controller,
          textInputAction: TextInputAction.search,
          onSubmitted: controller.text == ''
              ? null
              : (a) {
                  BlocProvider.of<SearchBloc>(context).add(Search(query: a));
                },
          keyboardType: TextInputType.visiblePassword,
          cursorColor: AppTheme.primary,
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
          suffix: controller.text == ''
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    controller.text = '';
                    BlocProvider.of<SearchBloc>(context).add(ClearSearch());
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xff6A737D),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppConstants.searchCancelIcon,
                      fit: BoxFit.none,
                      color: const Color(0xff2F363D),
                      width: 12,
                      height: 12,
                    ),
                  ),
                ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff2F363D),
          ),
        ),
      );
}
