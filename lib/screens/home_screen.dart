import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_fernanda/data/repositories/github_repository.dart';
import 'package:flutter_challenge_fernanda/presentation/bloc/repository_bloc.dart';
import 'package:flutter_challenge_fernanda/screens/repository_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RepositoryBloc(GithubRepositoryImpl())..add(FetchRepositoriesEvent()),
      child: RepositoryListScreen(),
    );
  }
}
