import 'package:github_repos/core/singletons/dio_settings.dart';
import 'package:github_repos/core/singletons/service_locator.dart';
import 'package:github_repos/models/base_pagination.dart';
import 'package:github_repos/models/issue.dart';

class RepositoryService {
  Future<BasePagination> searchRepositories({
    required String query,
    required int page,
  }) async {
    final _dio = serviceLocator<DioSettings>().dio;

    final response = await _dio.get(
      'search/repositories',
      queryParameters: {
        'q': query,
        'per_page': 10,
        'page': page,
      },
    );
    print(response.data);
    print(response.statusCode);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return BasePagination.fromJson(response.data);
    } else {
      final message = '${(response.data as Map<String, dynamic>).values.first}'
          .replaceAll(RegExp(r'[\[\]]'), '');
      throw Exception(message);
    }
  }

  Future<List<Issue>> getIssues(
      {required String username, required String repository}) async {
    final _dio = serviceLocator<DioSettings>().dio;
    final response = await _dio.get('repos/$username/$repository/issues');
    print(response.data);
    print(response.statusCode);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data as List).map((e) => Issue.fromJson(e)).toList();
    } else {
      final message = '${(response.data as Map<String, dynamic>).values.first}'
          .replaceAll(RegExp(r'[\[\]]'), '');
      throw Exception(message);
    }
  }
}
