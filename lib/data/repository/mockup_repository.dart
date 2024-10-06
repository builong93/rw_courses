import 'package:rw_courses/data/index.dart';

class MockupRepository implements Repository {
  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];

    courses.addAll([
      Course('1', 'Demo 1', 'Test 1'),
      Course('2', 'Demo 2', 'Test 2'),
      Course('3', 'Demo 3', 'Test 3'),
      Course('4', 'Demo 4', 'Test 4'),
    ]);

    return courses;
  }
}
