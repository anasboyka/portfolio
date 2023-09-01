import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/resume_file.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';
import 'package:portfolio/view/widgets/custom/expanded_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPageSmall extends StatelessWidget {
  const AboutPageSmall({super.key, required this.appBarHeight});
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    // print(MediaQueryData.fromView(View.of(context)).padding.top);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height +
          kToolbarHeight, // - appBarHeight.h,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            // height: 1117.h - appBarHeight.h, //1117.w - appBarHeight.w,
          ),
          Container(
            color: kccBlack3.withOpacity(0.8),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: kToolbarHeight +
                  MediaQueryData.fromView(View.of(context)).padding.top,
            ), //fromLTRB(100.w, appBarHeight.h, 100.w, 0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  kcshiImAnas,
                  style: kcfLHeadlineSmall().copyWith(
                    fontWeight: kcfbold,
                  ),
                  // textTheme.displaySmall
                  //     ?.copyWith(fontSize: 36.sp),
                ),
                gaph(h: 7.h),
                Text(
                  kcsMobileAppDeveloper,
                  style: kcfLHeadlineSmall().copyWith(
                    fontWeight: kcfbold,
                  ),
                  // textTheme.displaySmall
                  //     ?.copyWith(fontSize: 36.sp),
                ),
                gaph(h: 13.h),
                Text(kcsBasedInKualaLumpur,
                    style: kcfLTitleSmall().copyWith(
                      fontWeight: kcfsemibold,
                    )
                    // textTheme.headlineLarge
                    //     ?.copyWith(fontSize: 30.sp),
                    ),
                gaph(h: 15.h),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/profilepic.png',
                      //height: 562,
                      //fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: socialLinks
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: e.copyWith(row: true, iconWidth: 24.w),
                            ),
                          )
                          .toList(),
                    ),
                    gaph(h: 5.h),
                    MaterialButton(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: const BorderSide(
                          color: kccSecondary,
                          width: 2,
                        ),
                      ),
                      padding: kcaInset0,
                      hoverElevation: 3,
                      onPressed: () async {
                        ResumeFile resumeFile =
                            await FirestoreDb().getLatestResume();
                        final Uri url = Uri.parse(resumeFile.url);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 5.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('View Resume',
                                style: kcfLLabelLarge()
                                    .copyWith(fontWeight: kcfbold)),
                            gapw(w: 5.w),
                            Icon(
                              Icons.contact_page_outlined,
                              color: kccSecondary,
                              size: 24.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                DefaultTabController(
                  length: 4,
                  child: TabBar(
                    indicatorColor: kccWhite3,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.zero,
                    isScrollable: true,
                    // labelStyle: GoogleFonts.inter(
                    //   fontWeight: kcfmedium,
                    //   fontSize: 36,
                    // ),
                    labelColor: kccWhite,
                    labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
                    padding: EdgeInsets.zero,
                    dividerColor: kccTransparent,
                    // ƒ
                    tabs: const [
                      Tab(
                        child: Text(
                          'Biography',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'What I Do',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Prefered Location',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Programming skills',
                        ),
                      ),
                    ],
                  ),
                ),
                gaph(h: 12.h),
                Expanded(
                  flex: 2,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: ExpandedText(
                          kcsBioContent,
                          trimLines: 3,
                          isExpanded: true,
                          onTapLink: () {},
                          linkColor: kccSecondary,
                          style:
                              kcfLLabelLarge().copyWith(fontWeight: kcfregular),
                        ),
                      ),
                      Container(
                        color: kccWhite,
                        height: 300,
                        width: 200,
                      ),
                    ],
                  ),
                ),
                //gaphr(),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              kcsWorkingExperience.toTitleCase(),
                              style: kcfLTitleSmall().copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                            gaphr(),
                            Text(
                              kcsWorkingExperienceContent,
                              style: GoogleFonts.lora(
                                color: kccWhite,
                                fontWeight: kcfmedium,
                                fontSize: 30.sp,
                              ),
                            ),
                            gaph(h: 30.h),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              kcsCompletedProjects.toTitleCase(),
                              style: kcfLTitleSmall().copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                            gaphr(),
                            Text(
                              kcsCompletedProjectsContent,
                              style: GoogleFonts.lora(
                                color: kccWhite,
                                fontWeight: kcfmedium,
                                fontSize: 30.sp,
                              ),
                            ),
                            gaph(h: 30.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row skillBar(TextTheme textTheme, String title, double val) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          style: textTheme.bodySmall
              ?.copyWith(fontSize: 18.sp, fontWeight: kcfsemibold),
        )),
        SizedBox(
          width: 154.w,
          child: LinearProgressIndicator(
            value: val,
            color: kccSecondary,
            backgroundColor: kccWhite3,
          ),
        )
      ],
    );
  }

  Column dataContent(TextTheme textTheme, String title,
      {String? content, Widget? child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
              color: kccSecondary, borderRadius: BorderRadius.circular(6.r)),
          child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
          ),
        ),
        gaph(h: 15.h),
        child ??
            SizedBox(
              width: 420.w,
              child: Text(
                content ?? '',
                style: textTheme.bodySmall?.copyWith(fontSize: 18.sp),
              ),
            ),
      ],
    );
  }
}
