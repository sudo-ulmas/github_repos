import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/bloc/search_bloc.dart';
import 'package:github_repos/core/constants.dart';
import 'package:github_repos/core/singletons/service_locator.dart';
import 'package:github_repos/core/theme.dart';
import 'package:github_repos/services/repository.dart';

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
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: BlocProvider(
          create: (context) => SearchBloc(RepositoryService()),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const SearchAppbar(),
            body: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const SearchScreenBody();
                } else if (state is SearchLoadingResults) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state is SearchLoadingError) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is SearchLoadedEmpty) {
                  return const Center(
                    child: Text('empty'),
                  );
                } else if (state is SearchLoadedWithResults) {
                  return Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 0.2,
                        height: 1,
                        indent: 20,
                        color: Color(0xffE1E4E8),
                      ),
                      itemCount: state.repositories.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(20),
                        color: Theme.of(context).colorScheme.surface,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  state.repositories[index].owner.avatarUrl,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(state.repositories[index].owner.login,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.repositories[index].name,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(height: 12),
                            if (state.repositories[index].description !=
                                '') ...{
                              Text(
                                state.repositories[index].description,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(height: 12),
                            },
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppConstants.starIcon,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  state.repositories[index].starCount
                                      .toString(),
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
                                  state.repositories[index].language,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      );
}

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({Key? key}) : super(key: key);

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
