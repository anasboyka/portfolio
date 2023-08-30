import 'package:flutter/material.dart';
import 'package:portfolio/view/pages/homepage/project/layout/project_page_large.dart';
import 'package:portfolio/view/widgets/layout/adaptive_layout.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  // final PageNumberNavigationController _controller1 =
  //     PageNumberNavigationController();

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    return AdaptiveLayout(bodyLarge: (context, constraint, layout) {
      return const ProjectPageLarge();
      // return DefaultTabController(
      //   length: 5,
      //   child: Column(
      //     children: [
      //       gaph(h: 20.h),
      //       Text(
      //         'Projects',
      //         style: textTheme.displayLarge?.copyWith(fontSize: 50.sp),
      //       ),
      //       Text(
      //         "All of my completed projects",
      //         style: textTheme.bodyMedium?.copyWith(
      //             color: kccgrey1, fontWeight: kcfregular, fontSize: 20.sp),
      //       ),
      //       gaph(h: 50.h),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 100.w),
      //         child: const Column(
      //           children: [
      //             // Align(
      //             //   alignment: Alignment.centerLeft,
      //             //   child: TabBar(
      //             //     indicatorColor: kccWhite3,
      //             //     indicatorSize: TabBarIndicatorSize.label,
      //             //     indicatorPadding: EdgeInsets.zero,
      //             //     isScrollable: true,
      //             //     labelStyle: GoogleFonts.inter(
      //             //       fontWeight: kcfmedium,
      //             //       fontSize: 36,
      //             //     ),
      //             //     labelColor: kccWhite,
      //             //     labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
      //             //     padding: EdgeInsets.zero,
      //             //     dividerColor: kccTransparent,
      //             //     unselectedLabelStyle: GoogleFonts.inter(
      //             //       fontWeight: kcflight,
      //             //       fontSize: 36,
      //             //       color: kccWhite3,
      //             //     ),
      //             //     tabs: const [
      //             //       Tab(
      //             //         child: Text(
      //             //           'Featured',
      //             //         ),
      //             //       ),
      //             //       Tab(
      //             //         child: Text(
      //             //           'Recent',
      //             //         ),
      //             //       ),
      //             //       Tab(
      //             //         child: Text(
      //             //           'All',
      //             //         ),
      //             //       ),
      //             //       Tab(
      //             //         child: Text(
      //             //           'Mobile Apps',
      //             //         ),
      //             //       ),
      //             //       Tab(
      //             //         child: Text(
      //             //           'Electronics',
      //             //         ),
      //             //       ),
      //             //     ],
      //             //   ),
      //             // ),
      //             ProjectPageContent(
      //               projCategory: ProjCategory.all,
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // );
    });
  }
}
