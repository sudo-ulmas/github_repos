import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/screens/search/widgets/search_appbar.dart';
import 'package:github_repos/screens/search/widgets/search_empty.dart';
import 'package:github_repos/screens/search/widgets/search_error.dart';
import 'package:github_repos/screens/search/widgets/search_initial.dart';
import 'package:github_repos/screens/search/widgets/search_loading.dart';
import 'package:github_repos/screens/search/widgets/search_results.dart';
import 'package:github_repos/services/repository.dart';

import 'bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchBloc searchBloc;
  late Timer _debounce;
  late ScrollController controller;

  Future<void> _updatePosition(
      VoidCallback event, ScrollController controller) async {
    event();
    await controller.animateTo(controller.position.maxScrollExtent + 10,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    _debounce.cancel();
  }

  @override
  void initState() {
    searchBloc = SearchBloc(
      RepositoryService(),
    );

    _debounce = Timer(const Duration(milliseconds: 0), () => print);
    controller = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller.addListener(
      () {
        SearchState state = searchBloc.state;
        if (controller.position.maxScrollExtent < controller.offset &&
            state is SearchLoadedWithResults) {
          if (state.repositories.length != state.totalCount &&
              !_debounce.isActive) {
            _debounce = Timer(
              const Duration(milliseconds: 500),
              () async => await _updatePosition(
                  () => searchBloc.add(
                        SearchMoreRepositories(),
                      ),
                  controller),
            );
          }
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _debounce.cancel();
    searchBloc.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: BlocProvider.value(
          value: searchBloc,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const SearchAppbar(),
            body: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const SearchInital();
                } else if (state is SearchLoadingResults) {
                  return const SearchLoading();
                } else if (state is SearchLoadingError) {
                  return SearchError(errorMessage: state.errorMessage);
                } else if (state is SearchLoadedEmpty) {
                  return const SearchEmpty();
                } else if (state is SearchLoadedWithResults) {
                  return SearchResults(
                    repos: state.repositories,
                    controller: controller,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      );
}
