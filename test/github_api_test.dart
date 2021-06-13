import 'package:flutter_challenge_fernanda/data/datasource/github_api.dart';
import 'package:flutter_challenge_fernanda/data/models/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_api_test.mocks.dart';
import 'json.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Fetch Repositories from github', () {
    var client;
    String url = '';

    setUp(() {
      client = MockClient();
      url = GithubApi.BASE_URL + 'users/${GithubApi.REPOSITORY_OWNER}/repos';
    });

    test(
        'returns a RepositoryListModel if the http call completes successfully',
        () async {
      when(client.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response(JsonResult.json, 200));
      RepositoryListModel listModel = await GithubApi.getRepositories(client);
      expect(listModel, isA<RepositoryListModel>());
    });
    test('returns a Filled list if the http call completes successfully',
        () async {
      when(client.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response(JsonResult.json, 200));
      RepositoryListModel listModel = await GithubApi.getRepositories(client);

      expect(listModel.list, isNotEmpty);
    });
    test('throws an exception if the http call completes with an error', () {
      // final client = MockClient();
      when(client.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(GithubApi.getRepositories(client), throwsException);
    });
  });
}
