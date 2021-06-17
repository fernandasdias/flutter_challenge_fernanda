class RepositoryDetail {
  List<Commit> commits = [];
  RepositoryDetail.fromJson(dynamic json) {
    print('here');
    if (json != null)
      json.forEach(
          (element) => {commits.add(Commit.fromJson(element['commit']))});
  }
}

class Commit {
  Author author = Author();
  String message = '';
  late String url;
  Committer committer = Committer();
  Commit.fromJson(Map<String, dynamic> element) {
    try {
      message = element['message'] ?? '';
      url = element['url'] ?? '';
      author = Author.fromJson(element['author']);
      committer = Committer.fromJson(element['committer']);
    } on Exception catch (e) {
      rethrow;
    }
  }
}

class Committer {
  String name = '';
  String email = '';
  DateTime? date;
  Committer();
  Committer.fromJson(Map<String, dynamic> element) {
    try {
      name = element['name'] ?? '';
      email = element['email'] ?? '';
      date = DateTime.tryParse(element['date']);
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}

class Author {
  String name = '';
  String email = '';
  DateTime? date;
  Author();
  Author.fromJson(dynamic element) {
    try {
      name = element['name'] ?? '';
      email = element['email'] ?? '';
      date = DateTime.tryParse(element['date']) ?? null;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
