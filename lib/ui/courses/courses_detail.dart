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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(context),
          _buildMain(context),
          _buildDetails(context),
        ],
      )),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: course.artworkUrl != null
            ? DecorationImage(image: NetworkImage(course.artworkUrl))
            : null,
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            course.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            course.description,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: const Color.fromARGB(255, 48, 45, 45)),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Domain(s): ${course.domainsString}',
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            'Level: ${course.difficulty}',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}