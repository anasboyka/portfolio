import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/pages/homepage/expertise/layout/expertise_page_large.dart';
import 'package:portfolio/view/pages/homepage/expertise/layout/expertise_page_medium.dart';
import 'package:portfolio/view/pages/homepage/expertise/layout/expertise_page_small.dart';
import 'package:portfolio/view/widgets/layout/adaptive_layout.dart';

class ExpertisePage extends StatefulWidget {
  const ExpertisePage({super.key});

  @override
  State<ExpertisePage> createState() => _ExpertisePageState();
}

class _ExpertisePageState extends State<ExpertisePage> {
  Knowledge knowledgeMobile = Knowledge.skills;
  Knowledge knowledgeIot = Knowledge.skills;
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mediumOrSmallMinWidth: 800,
      bodySmall: (context, constraint, screenSize) =>
          const ExpertisePageSmall(),
      bodyMedium: (context, constraint, screenSize) =>
          const ExpertisePageMedium(),
      bodyLarge: (context, constraint, layout) {
        return const ExpertisePageLarge();
      },
    );
  }
}
