import 'package:flutter/material.dart';
import 'package:rw_courses/constants/index.dart';
import 'package:rw_courses/data/index.dart';

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
        );
      },
    );
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(
            course.description,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.grey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
