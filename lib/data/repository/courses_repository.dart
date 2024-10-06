import 'dart:convert';

import 'package:rw_courses/constants/index.dart';
import 'package:rw_courses/data/index.dart';
import 'package:http/http.dart' as http;

class CoursesRepository implements Repository {
  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    var url = Constants.rwAPI;
    if (domainFilter != Constants.allFilter) {
      //Nếu có lọc dữ liệu
      url += '&filter[domain_ids][]=$domainFilter';
    }

    final uri = Uri.parse(url);

    final response = await http.get(uri);
    //Giải mã kết quả json trả về
    final jsonMap = json.decode(response.body) as Map<String, dynamic>;
    //=> Lấy list data
    final data = jsonMap['data'] as List;
    //Lặp tất cả phần tử trong list data => List<Course> => courses
    for (var json in data) {
      final course = Course.fromJson(json);
      courses.add(course);
    }

    return courses;
  }
}
