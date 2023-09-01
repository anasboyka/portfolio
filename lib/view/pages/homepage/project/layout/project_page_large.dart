import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/pages/homepage/project/project_page_content.dart';

class ProjectPageLarge extends StatefulWidget {
  const ProjectPageLarge({super.key});

  @override
  State<ProjectPageLarge> createState() => _ProjectPageLargeState();
}

class _ProjectPageLargeState extends State<ProjectPageLarge> {
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          gaph(h: 20.h),
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
          gaph(h: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
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
                //     labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
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
                ProjectPageContent(
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
