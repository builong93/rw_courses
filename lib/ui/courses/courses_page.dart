import 'package:flutter/material.dart';
import 'package:rw_courses/constants/index.dart';
import 'package:rw_courses/data/index.dart';
import 'package:rw_courses/ui/courses/courses_detail.dart';

import 'courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CoursesRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.fetchCourses(Constants.allFilter),
      builder: (context, snapshot) {
        final courses = snapshot.data;
        if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        if (courses == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: courses.length,
          //itemBuilder sẽ được gọi ở mỗi phần tử
          //=> Vẽ phần tử thứ index lên màn hình
          itemBuilder: (context, index) {
            //index => Vị trí để vẽ phẩn tử thứ index
            final course = courses[index];
            return _buildRow(course);
          },
          padding: const EdgeInsets.all(16),
        );
      },
    );
  }

  Widget _buildRow(Course course) {
    return ListTile(
      title: Text('${course.name}'),
      trailing:
          course.artworkUrl != null ? Image.network(course.artworkUrl) : null,
      subtitle: Text(course.domainsString),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CoursesDetail(course: course)));
      },
    );
  }
}
