import 'package:flutter/material.dart';
import 'package:portfolio/view/pages/homepage/project/layout/large/project_page_large.dart';
import 'package:portfolio/view/pages/homepage/project/layout/medium/project_page_medium.dart';
import 'package:portfolio/view/pages/homepage/project/layout/small/project_page_small.dart';
import 'package:portfolio/view/widgets/layout/adaptive_layout.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mediumOrSmallMinWidth: 840,
        bodySmall: (context, constraint, screenSize) => ProjectPageSmall(
              constraints: constraint,
            ),
        bodyMedium: (context, constraint, screenSize) {
          return const ProjectPageMedium();
        },
        bodyLarge: (context, constraint, layout) {
          return const ProjectPageLarge();
        });
  }
}
