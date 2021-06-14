import 'package:flutter_challenge_fernanda/data/datasource/github_api.dart';
import 'package:flutter_challenge_fernanda/data/models/repository_model.dart';
import 'package:http/http.dart';

abstract class GithubRepository {
  Future<RepositoryListModel> fetchGithubRepositories();
  Future<dynamic> fetchRepositoryDetail(String name);
}

class GithubRepositoryImpl implements GithubRepository {
  Client client = Client();
  Future<RepositoryListModel> fetchGithubRepositories() async =>
      await GithubApi.getRepositories(client);

  @override
  Future fetchRepositoryDetail(String name) async {
    // https://api.github.com/repos/wearereasonablepeople/ApiConnector/commits
    await GithubApi.fetchRepositoryDetail(client, name);
  }
}
