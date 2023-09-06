import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/pages/homepage/project/layout/small/project_page_content_small.dart';

class ProjectPageSmall extends StatelessWidget {
  final BoxConstraints constraints;
  const ProjectPageSmall({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: kccPrimary,
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            gaph(h: 20),
            Text('Projects',
                style:
                    kcfLHeadlineSmall(r: false).copyWith(fontWeight: kcfbold)),
            Text(
              "All of my completed projects",
              style: kcfSBodyMedium().copyWith(color: kccgrey1),
            ),
            gaph(h: 20),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //  child:
            Column(
              children: [
                ProjectPageContentSmall(
                  constraint: constraints,
                  projCategory: ProjCategory.all,
                ),
              ],
            ),
            //   )
            gaph(),
          ],
        ),
      ),
    );
  }
}
