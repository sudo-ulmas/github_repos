import 'package:github_repos/core/singletons/dio_settings.dart';
import 'package:github_repos/core/singletons/service_locator.dart';
import 'package:github_repos/models/repository.dart';

class RepositoryService {
  Future<List<Repository>> searchRepositories({required String query}) async {
    final _dio = serviceLocator<DioSettings>().dio;

    final response = await _dio.get(
      'search/repositories',
      queryParameters: {
        'q': query,
      },
    );
    print(response.data);
    print(response.statusCode);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data['items'] as List)
          .map((e) => Repository.fromJson(e))
          .toList();
    } else {
      final message = '${(response.data as Map<String, dynamic>).values.first}'
          .replaceAll(RegExp(r'[\[\]]'), '');
      throw Exception(message);
    }
  }
}
