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
              style: kcfLDisplayLarge().copyWith(fontWeight: kcfbold)
              // textTheme.displayLarge?.copyWith(fontSize: 50.sp),
              ),
          Text(
            "All of my completed projects",
            style: kcfLBodyMedium().copyWith(color: kccgrey1),
            // textTheme.bodyMedium?.copyWith(
            //     color: kccgrey1, fontWeight: kcfregular, fontSize: 20.sp),
          ),
          gaph(h: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: const Column(
              children: [
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: TabBar(
                //     indicatorColor: kccWhite3,
                //     indicatorSize: TabBarIndicatorSize.label,
                //     indicatorPadding: EdgeInsets.zero,
                //     isScrollable: true,
                //     labelStyle: GoogleFonts.inter(
                //       fontWeight: kcfmedium,
                //       fontSize: 36,
                //     ),
                //     labelColor: kccWhite,
                //     labelPadding: EdgeInsets.symmetric(horizontal: 25),
                //     padding: EdgeInsets.zero,
                //     dividerColor: kccTransparent,
                //     unselectedLabelStyle: GoogleFonts.inter(
                //       fontWeight: kcflight,
                //       fontSize: 36,
                //       color: kccWhite3,
                //     ),
                //     tabs: const [
                //       Tab(
                //         child: Text(
                //           'Featured',
                //         ),
                //       ),
                //       Tab(
                //         child: Text(
                //           'Recent',
                //         ),
                //       ),
                //       Tab(
                //         child: Text(
                //           'All',
                //         ),
                //       ),
                //       Tab(
                //         child: Text(
                //           'Mobile Apps',
                //         ),
                //       ),
                //       Tab(
                //         child: Text(
                //           'Electronics',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

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
