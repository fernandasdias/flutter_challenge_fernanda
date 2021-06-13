import 'package:flutter_challenge_fernanda/data/models/repository_model.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('repositories should not be null', () async {
    final GithubRepository repository = GithubRepositoryImpl();
    RepositoryListModel repo = await repository.fetchGithubRepositories();

    expect(repo.list, isNotEmpty);
  });
}
