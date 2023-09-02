import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/resume_file.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';
import 'package:portfolio/view/widgets/custom/expanded_text.dart';
import 'package:portfolio/view/widgets/custom/pageview/expandable_pageview.dart';

class AboutPageMedium extends StatefulWidget {
  const AboutPageMedium({super.key, required this.appBarHeight});
  final double appBarHeight;

  @override
  State<AboutPageMedium> createState() => _AboutPageMediumState();
}

class _AboutPageMediumState extends State<AboutPageMedium> {
  TextStyle contentStyle = kcfSBodyMedium();
  int maxMultiline = 4;
  List<UserDetail> details = [
    UserDetail(data: kcsBioContent),
  ];
  @override
  Widget build(BuildContext context) {
    // print(MediaQueryData.fromView(View.of(context)).padding.top);
    return SizedBox(
      child: UnconstrainedBox(
        //+    kToolbarHeight, // - appBarHeight.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: kccBlack3.withOpacity(0.8),
            child: Padding(
              padding: EdgeInsets.only(
                top: kToolbarHeight +
                    MediaQueryData.fromView(View.of(context)).padding.top,
                bottom: 20,
              ), //fromLTRB(100.w, appBarHeight.h, 100.w, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  SizedBox(
                    height: 380,
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
                              horizontal: 8.w, vertical: 2.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View Resume',
                                style: kcfLLabelLarge().copyWith(
                                    fontWeight: kcfmedium, color: kccSecondary),
                              ),
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
                      unselectedLabelStyle: kcfLTitleSmall(),
                      isScrollable: true,
                      labelStyle: kcfLTitleLarge().copyWith(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
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
                  // ExpandablePageView(
                  //   children: [
                  //     // ContentExpanded(
                  //     //   data: kcsBioContent,
                  //     //   maxMultiline: maxMultiline,
                  //     // ),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 14.w),
                  //       child: ExpandedText(
                  //         kcsWhatDoIDoContent,
                  //         trimLines: 3,
                  //         isExpanded: false,
                  //         onTapLink: () {},
                  //         linkColor: kccSecondary,
                  //         style: contentStyle,
                  //       ),
                  //     ),
                  //     Container(
                  //       color: kccWhite,
                  //       height: 300,
                  //       width: 200,
                  //     ),
                  //   ],
                  // ),
                  // Expanded(
                  //   flex: 2,
                  //  child:
                  // SizedBox(
                  //   height:
                  //       calculateSingleLineHeight(contentStyle) * maxMultiline,
                  //   width: double.maxFinite,
                  //   child:
                  //   PageView(
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     children: [
                  //       ContentExpanded(
                  //         data: kcsBioContent,
                  //         maxMultiline: maxMultiline,
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 14.w),
                  //         child: ExpandedText(
                  //           kcsWhatDoIDoContent,
                  //           trimLines: 3,
                  //           isExpanded: false,
                  //           onTapLink: () {},
                  //           linkColor: kccSecondary,
                  //           style: contentStyle,
                  //         ),
                  //       ),
                  //       Container(
                  //         color: kccWhite,
                  //         height: 300,
                  //         width: 200,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // ),
                  gaphr(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kcsWorkingExperience.toTitleCase(),
                                style: kcfLTitleSmall().copyWith(
                                  fontWeight: FontWeight.bold,
                                  // decoration: TextDecoration.underline,
                                ),
                              ),
                              gaphr(),
                              Text(
                                kcsWorkingExperienceContent,
                                style: GoogleFonts.lora(
                                  color: kccWhite,
                                  fontWeight: kcfmedium,
                                  fontSize: 30.sp,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kcsCompletedProjects.toTitleCase(),
                                style: kcfLTitleSmall().copyWith(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 22.sp,
                                  // decoration: TextDecoration.underline,
                                ),
                              ),
                              gaphr(),
                              Text(
                                kcsCompletedProjectsContent,
                                style: GoogleFonts.lora(
                                    color: kccWhite,
                                    fontWeight: kcfmedium,
                                    fontSize: 30.sp,
                                    decoration: TextDecoration.underline),
                              ),
                              gaph(h: 30.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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

class UserDetail {
  String data;
  bool readMore;
  UserDetail({
    required this.data,
    this.readMore = false,
  });

  UserDetail copyWith({
    String? data,
    bool? readMore,
  }) {
    return UserDetail(
      data: data ?? this.data,
      readMore: readMore ?? this.readMore,
    );
  }
}
