import 'dart:convert';

import 'package:github_listview/entity/owner.dart';
import "package:test/test.dart";

void main() {
  test("Ownerが正しく生成されること", () {
    String bodyJson = '''
        {
          "login": "takami228",
          "avatar_url": "https://avatars3.githubusercontent.com/u/9018232?v=4"
        }
        ''';
    Owner owner = Owner.fromJson(json.decode(bodyJson));
    expect(owner.login, equals('takami228'));
    expect(owner.avatarUrl,
        equals('https://avatars3.githubusercontent.com/u/9018232?v=4'));
  });
}
