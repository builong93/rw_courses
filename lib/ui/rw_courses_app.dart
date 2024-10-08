import 'package:flutter/material.dart';
import 'package:rw_courses/constants/index.dart';
import 'package:rw_courses/ui/courses/courses_page.dart';

class RwCoursesApp extends StatelessWidget {
  const RwCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Center(
          child: Text(
            Strings.appTitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: const CoursesPage(),
    );
  }
}
