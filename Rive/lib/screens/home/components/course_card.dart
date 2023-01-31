import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/course.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: 280,
      width: 260,
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    course.description,
                    style: const TextStyle(color: Colors.white60),
                  ),
                ),
                const Text(
                  "61 SECTIONS - 11 HOURS",
                  style: TextStyle(color: Colors.white54),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(children: [
                    Transform.translate(
                      offset: Offset((-10).toDouble(), 0),
                      child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/avaters/Avatar1.jpg")),
                    ),
                    Transform.translate(
                      offset: Offset((-10).toDouble(), 0),
                      child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/avaters/Avatar2.jpg")),
                    ),
                    Transform.translate(
                      offset: Offset((-10).toDouble(), 0),
                      child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/avaters/Avatar5.jpg")),
                    ),
                  ]),
                )
              ],
            ),
          ),
          SvgPicture.asset(course.iconSrc)
        ],
      ),
    );
  }
}

