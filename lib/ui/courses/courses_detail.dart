import 'package:flutter/material.dart';

import '../../data/index.dart';

class CoursesDetail extends StatelessWidget {
  final Course course;

  const CoursesDetail({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Center(
          child: Text(
            course.name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Image.network(course.artworkUrl),
          Text(course.name),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              style: TextStyle(color: Colors.grey[600]), textAlign: TextAlign.justify,),
          Text(
            'Domain(s): Flutter',
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            'Level: ${course.difficulty}',
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(course.contributors, style: TextStyle(fontSize: 18),),
          Text('View Courses')
        ],
      )),
    );
  }
}
