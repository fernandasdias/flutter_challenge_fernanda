import 'package:flutter/material.dart';
import 'package:flutter_challenge_fernanda/data/datasource/github_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GithubApi.getRepositories();
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
