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
    // var coursesNamed = course.name.length > 30
    //     ? course.name.substring(0, 30) + "..."
    //     : course.name;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursesDetail(course: course),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      color: Color.fromARGB(216, 29, 26, 26),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Flutter',
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              ),
            ),
            Image.network(
              course.artworkUrl,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
