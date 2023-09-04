import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/pages/homepage/project/layout/small/project_page_content_small.dart';

class ProjectPageSmall extends StatelessWidget {
  const ProjectPageSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: kccPrimary,
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            gaph(h: 20.h),
            Text('Projects',
                style: kcfLHeadlineSmall().copyWith(fontWeight: kcfbold)),
            Text(
              "All of my completed projects",
              style: kcfSBodyMedium().copyWith(color: kccgrey1),
            ),
            gaph(h: 20.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //  child:
            const Column(
              children: [
                ProjectPageContentSmall(
                  projCategory: ProjCategory.all,
                ),
              ],
            ),
            //   )
            gaphr(),
          ],
        ),
      ),
    );
  }
}
