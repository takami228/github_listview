import 'package:infinite_scroll/entity/owner.dart';

class Repository {
  final String name;
  final String fullName;
  final Owner owner;
  final String htmlUrl;
  final int stargazersCount;
  final String language;

  Repository(
      {this.name,
      this.fullName,
      this.owner,
      this.htmlUrl,
      this.stargazersCount,
      this.language});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'],
      fullName: json['full_name'],
      owner: Owner.fromJson(json['owner']),
      htmlUrl: json['html_url'],
      stargazersCount: json['stargazers_count'],
      language: json['language'],
      //language: json['language'] == null ? "anonymous" : json['language'],
    );
  }
}
