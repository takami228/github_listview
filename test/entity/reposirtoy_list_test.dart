import 'dart:convert';

import 'package:github_listview/entity/repostory_list.dart';
import "package:test/test.dart";

void main() {
  test("RepostoryListが正しく生成されること", () {
    String bodyJson = '''
        [{
            "name": "WeatherApp",
            "full_name": "takami228/WeatherApp",
            "owner": {
              "login": "takami228",
              "avatar_url": "https://avatars3.githubusercontent.com/u/9018232?v=4"
            },
            "html_url": "https://github.com/takami228/WeatherApp",
            "stargazers_count": 0,
            "language": "Java"
          },
          {
            "name": "todolist-api",
            "full_name": "takami228/todolist-api",
            "owner": {
              "login": "takami228",
              "avatar_url": "https://avatars3.githubusercontent.com/u/9018232?v=4"
            },
            "html_url": "https://github.com/takami228/todolist-api",
            "stargazers_count": 0,
            "language": "Java"
          }
        ]
        ''';

    RepositoryList repositoryList =
        RepositoryList.fromJson(json.decode(bodyJson));

    expect(repositoryList.get(0).name, equals('WeatherApp'));
    expect(repositoryList.get(0).fullName, equals('takami228/WeatherApp'));
    expect(repositoryList.get(0).owner.login, equals('takami228'));
    expect(repositoryList.get(0).owner.avatarUrl,
        equals('https://avatars3.githubusercontent.com/u/9018232?v=4'));
    expect(repositoryList.get(0).htmlUrl,
        equals('https://github.com/takami228/WeatherApp'));
    expect(repositoryList.get(0).language, equals('Java'));

    expect(repositoryList.get(1).name, equals('todolist-api'));
    expect(repositoryList.get(1).fullName, equals('takami228/todolist-api'));
    expect(repositoryList.get(1).owner.login, equals('takami228'));
    expect(repositoryList.get(1).owner.avatarUrl,
        equals('https://avatars3.githubusercontent.com/u/9018232?v=4'));
    expect(repositoryList.get(1).htmlUrl,
        equals('https://github.com/takami228/todolist-api'));
    expect(repositoryList.get(1).language, equals('Java'));
  });
}
