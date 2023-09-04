import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';
import 'package:portfolio/view/pages/homepage/project/project_card_large.dart';
import 'package:portfolio/view/widgets/navigation/page_number_navigation/page_number_control.dart';

class ProjectPageContentLarge extends StatefulWidget {
  final ProjCategory projCategory;
  const ProjectPageContentLarge({super.key, required this.projCategory});

  @override
  State<ProjectPageContentLarge> createState() => _ProjectPageContentLargeState();
}

class _ProjectPageContentLargeState extends State<ProjectPageContentLarge> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        gaph(h: 70.h),
        FutureBuilder(
            future:
                FirestoreDb().getProjectByCategories(widget.projCategory.text),
            builder: (context, AsyncSnapshot snapshot) {
              // if (snapshot.hasError) {
              //   print(snapshot.error);
              //   print(snapshot.stackTrace);
              //   print(snapshot.hasError);
              //   return SizedBox();
              // }
              // if (snapshot.connectionState == ConnectionState.none) {
              //   print('none');
              //   return SizedBox();
              // } else if (snapshot.connectionState == ConnectionState.active) {
              //   print('active');
              //   return SizedBox();
              // } else {}
              if (snapshot.hasData) {
                List<ProjectData> projects = snapshot.data;
                int lastPage = (projects.length / 2).ceil();
                bool topBtmFilled =
                    currentPage != lastPage || (projects.length % 2 == 0);
                int indexTop = (currentPage - 1) * 2;
                int? indexBtm;
                if (topBtmFilled) {
                  indexBtm = (currentPage - 1) * 2 + 1;
                }

                // print("done loading");

                return projectPageDisplay(
                  projects[indexTop],
                  indexBtm != null ? projects[indexBtm] : null,
                );
              } else {
                print("loading");
                return const CircularProgressIndicator(
                  color: kccWhite,
                );
              }
            }),
        gaph(h: 30),
        FutureBuilder(
            future: FirestoreDb().getProjectPage(widget.projCategory),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                int itemCount = snapshot.data;
                int lastPage = (itemCount / 2).ceil();
                return PageNumberControl(
                  pageButtonMinWidth: 60.w,
                  height: 60.h,
                  currentPage: currentPage,
                  lastPage: lastPage,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 36.sp,
                    color: kccWhite,
                    fontWeight: kcfmedium,
                  ),
                  onNextPressed: () {
                    setState(() {
                      currentPage++;
                    });
                    // print(currentPage);
                  },
                  onPrevPressed: () {
                    setState(() {
                      currentPage--;
                    });
                    // print(currentPage);
                  },
                  onChanged: lastPage == 1
                      ? null
                      : (value) {
                          setState(() {
                            currentPage = int.parse(value ?? '1');
                          });
                        },
                );
              } else {
                return const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(child: CircularProgressIndicator()));
              }
            }),
      ],
    );
  }

  Column projectPageDisplay(
    // TextTheme textTheme,
    ProjectData projectTop,
    ProjectData? projectBottom,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProjectCardLarge(
          key: UniqueKey(),
          project: projectTop,
        ),
        gaph(h: 30.h),
        ProjectCardLarge(
          key: UniqueKey(),
          project: projectBottom,
        )
      ],
    );
  }
}
