import 'dart:convert';

import 'package:infinite_scroll/entity/repository.dart';
import "package:test/test.dart";

void main() {
  test("Repositoryが正しく生成されること", () {
    String bodyJson = '''
    { "name": "WeatherApp",
      "full_name": "takami228/WeatherApp",
      "owner": {
        "login": "takami228",
        "avatar_url": "https://avatars3.githubusercontent.com/u/9018232?v=4"
      },
      "html_url": "https://github.com/takami228/WeatherApp",
      "stargazers_count": 0,
      "language": "Java"
     }
    ''';
    Repository repository = Repository.fromJson(json.decode(bodyJson));
    expect(repository.name, equals('WeatherApp'));
    expect(repository.fullName, equals('takami228/WeatherApp'));
    expect(repository.owner.login, equals('takami228'));
    expect(repository.owner.avatarUrl,
        equals('https://avatars3.githubusercontent.com/u/9018232?v=4'));
    expect(
        repository.htmlUrl, equals('https://github.com/takami228/WeatherApp'));
    expect(repository.language, equals('Java'));
  });
}
