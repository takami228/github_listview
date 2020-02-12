import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_listview/entity/repository.dart';
import 'package:github_listview/entity/repostory_list.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class RepositoryListView extends StatefulWidget {
  @override
  RepositoryListViewState createState() => new RepositoryListViewState();
}

class RepositoryListViewState extends State<RepositoryListView> {
  int _pageIndex = 0;
  Future<RepositoryList> _repositoryList;

  @override
  void initState() {
    super.initState();
    _repositoryList = fetchRepositoryList(_pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RepositoryList>(
      future: _repositoryList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListView(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}

Widget buildListView(RepositoryList list) {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: list.repositoryList.length,
      itemBuilder: (context, i) {
        return _buildItem(list.get(i));
      });
}

Widget _buildItem(Repository repo) {
  return ListTile(
    contentPadding: EdgeInsets.all(10.0),
    title: Text(
      repo.fullName,
      softWrap: true,
      maxLines: 1,
      style: TextStyle(fontSize: 24.0),
    ),
    subtitle: Text(repo.language),
    onTap: () => launch(repo.htmlUrl),
  );
}

Future<RepositoryList> fetchRepositoryList(int index) async {
  final response = await http.get(
      'https://api.github.com/users/takami228/repos?per_page=10&page=' +
          index.toString());
  if (response.statusCode == 200) {
    return RepositoryList.fromJson(json.decode(response.body));
  } else {
    //TODO(takami228): Handle Error
    throw Exception('Failed to load post');
  }
}
