import 'dart:convert';

import 'package:flutter_challenge_fernanda/data/models/repository_model.dart';
import 'package:http/http.dart' show Client;

class GithubApi {
  static const BASE_URL = 'https://api.github.com/';
  static const REPOSITORY_OWNER = 'wearereasonablepeople';
//https://api.github.com/users/wearereasonablepeople/repos
  static Future<RepositoryListModel> getRepositories(Client client) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };

    String url = BASE_URL + 'users/$REPOSITORY_OWNER/repos';
    try {
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return RepositoryListModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to get API content');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
