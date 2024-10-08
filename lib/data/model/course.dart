//Class Course => Chứa thông tin khoá học trả về từ API
import 'package:rw_courses/constants/index.dart';

class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  final List<String> domains;
  Course(this.courseId, this.name, this.description, this.artworkUrl,
      this.difficulty, this.contributors, this.domains);
  String get domainsString => domains.join(", ");
  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'],
        name = json['attributes']['name'],
        description = json['attributes']['description'],
        artworkUrl = json['attributes']['card_artwork_url'],
        difficulty = json['attributes']['difficulty'],
        contributors = json['attributes']['contributor_string'],
        domains = [] {
    // Lấy danh sách id từ domains trong relationships
    final domainIds = (json['relationships']['domains']['data'] as List)
        .map((domain) => domain['id'].toString())
        .toList();

    for (var domain in domainIds) {
      switch (domain) {
        case Constants.iosDomain:
          domains.add(Strings.iOS);
        case Constants.androidDomain:
          domains.add(Strings.android);
        case Constants.unityDomain:
          domains.add(Strings.unity);
        case Constants.macOSDomain:
          domains.add(Strings.macOS);
        case Constants.archivedDomain:
          domains.add(Strings.archived);
        case Constants.flutterDomain:
          domains.add(Strings.flutter);
        case Constants.sssDomain:
          domains.add(Strings.sss);
        default:
      }
    }
  }
  @override
  String toString() {
    return name;
  }
}
