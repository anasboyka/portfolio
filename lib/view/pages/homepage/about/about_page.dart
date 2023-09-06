import 'package:flutter/material.dart';
import 'package:portfolio/view/pages/homepage/about/layout/about_page_large.dart';
import 'package:portfolio/view/pages/homepage/about/layout/about_page_medium.dart';
import 'package:portfolio/view/pages/homepage/about/layout/about_page_small.dart';
import 'package:portfolio/view/widgets/layout/adaptive_layout.dart';

class AboutPage extends StatelessWidget {
  final double appBarHeight;
  const AboutPage({super.key, required this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mediumOrSmallMinWidth: 650,
      bodySmall: (context, constraint, layout) {
        print(layout);
        return const AboutPageSmall(
            // appBarHeight: appBarHeight,
            );
      },
      bodyMedium: (context, constraint, layout) {
        print(layout);
        return const AboutPageMedium(
            // appBarHeight: appBarHeight,
            );
      },
      bodyLarge: (context, constraint, layout) {
        print(layout);
        return AboutPageLarge(appBarHeight: appBarHeight);
      },
    );
  }

  // Row skillBar(TextTheme textTheme, String title, double val) {
  //   return Row(
  //     children: [
  //       Expanded(
  //           child: Text(
  //         title,
  //         style: textTheme.bodySmall
  //             ?.copyWith(fontSize: 18.sp, fontWeight: kcfsemibold),
  //       )),
  //       SizedBox(
  //         width: 154.w,
  //         child: LinearProgressIndicator(
  //           value: val,
  //           color: kccSecondary,
  //           backgroundColor: kccWhite3,
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Column dataContent(TextTheme textTheme, String title,
  //     {String? content, Widget? child}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         padding: EdgeInsets.all(7.w),
  //         decoration: BoxDecoration(
  //             color: kccSecondary, borderRadius: BorderRadius.circular(6.r)),
  //         child: Text(
  //           title,
  //           style: textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
  //         ),
  //       ),
  //       gaph(h: 15.h),
  //       child ??
  //           SizedBox(
  //             width: 420.w,
  //             child: Text(
  //               content ?? '',
  //               style: textTheme.bodySmall?.copyWith(fontSize: 18.sp),
  //             ),
  //           ),
  //     ],
  //   );
  // }
}
