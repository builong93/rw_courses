import 'package:flutter/material.dart';
import 'package:rw_courses/ui/rw_courses_app.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: const RwCoursesApp(),
    ),
  );
}
