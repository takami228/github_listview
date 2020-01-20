import 'package:github_listview/entity/repository.dart';

class RepositoryList {
  final List<Repository> repositoryList;

  RepositoryList({this.repositoryList});

  factory RepositoryList.fromJson(List<dynamic> json) {
    return RepositoryList(
        repositoryList:
            json.map((value) => Repository.fromJson(value)).toList());
  }

  Repository get(int index) {
    return repositoryList[index];
  }
}
