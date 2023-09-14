import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/pages/homepage/project/layout/medium/project_page_content_medium.dart';

class ProjectPageMedium extends StatelessWidget {
  const ProjectPageMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          gaph(h: 20),
          Text('Projects',
              style: kcfLDisplayLarge().copyWith(fontWeight: kcfbold)),
          Text(
            "All of my completed projects",
            style: kcfLBodyMedium().copyWith(color: kccgrey1),
          ),
          gaph(h: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                ProjectPageContentMedium(
                  projCategory: ProjCategory.all,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
