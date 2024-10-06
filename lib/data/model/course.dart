//Class Course => Chứa thông tin khoá học trả về từ API
class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  // final List<String> domains;
  Course(this.courseId, this.name, this.description, this.artworkUrl,
      this.difficulty, this.contributors);

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'],
        name = json['attributes']['name'],
        description = json['attributes']['description'],
        artworkUrl = json['attributes']['card_artwork_url'],
        difficulty = json['attributes']['difficulty'],
        contributors = json['attributes']['contributor_string'];
        // domains = json['relationships']['domains']['data']['id'];
  @override
  String toString() {
    return name;
  }
}
