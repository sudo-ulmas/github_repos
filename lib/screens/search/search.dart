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

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                  return const SearchInital();
                } else if (state is SearchLoadingResults) {
                  return const SearchLoading();
                } else if (state is SearchLoadingError) {
                  return SearchError(errorMessage: state.errorMessage);
                } else if (state is SearchLoadedEmpty) {
                  return const SearchEmpty();
                } else if (state is SearchLoadedWithResults) {
                  return SearchResults(repos: state.repositories);
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      );
}
