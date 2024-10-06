import 'package:rw_courses/data/index.dart';

class MockupRepository implements Repository {
  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];

    return courses;
  }
}
