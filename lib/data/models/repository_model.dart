class RepositoryListModel {
  RepositoryListModel();
  List<Repository> list = [];
  RepositoryListModel.fromJson(dynamic json) {
    if (json != null) {
      json.forEach((element) => {
            list.add(Repository.fromJson(element)),
          });
    }
  }
}

class Repository {
  String? name;
  String? fullName;
  String? url;
  String? language;
  String? avatar;
  String? type;
  DateTime? createdAt;
  Repository.fromJson(element) {
    try {
      if (element['name'] != null) name = element['name'];
      if (element['full_name'] != null) fullName = element['full_name'];
      if (element['url'] != null) url = element['url'];
      if (element['language'] != null) language = element['language'];
      if (element['owner']['avatar_url'] != null)
        avatar = element['owner']['avatar_url'];
      if (element['type'] != null) type = element['type'];
      if (element['created_at'] != null)
        createdAt = DateTime.tryParse(element['created_at']);
      print(createdAt);
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}
