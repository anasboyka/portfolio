import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/resume_file.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutPageLarge extends StatelessWidget {
  const AboutPageLarge({super.key, required this.appBarHeight});
  final double appBarHeight;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 1117.w - appBarHeight.w,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            // width: double.infinity,
            // height: 1117.h - appBarHeight.h, //1117.w - appBarHeight.w,
          ),
          Container(
            color: kccblack3.withOpacity(0.8),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100.w, appBarHeight.h, 100.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    dataContent(
                      textTheme,
                      kcsBiography,
                      content: kcsBioContent,
                    ),
                    dataContent(
                      textTheme,
                      kcsWhatDoIDo,
                      content: kcsWhatDoIDoContent,
                    ),
                    dataContent(
                      textTheme,
                      kcsPreferedLocation,
                      content: kcsPreferedLocationContent,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          kcshiImAnas,
                          style:
                              textTheme.displaySmall?.copyWith(fontSize: 36.sp),
                        ),
                        Text(
                          kcsMobileAppDeveloper,
                          style:
                              textTheme.displaySmall?.copyWith(fontSize: 36.sp),
                        ),
                        gaph(h: 15.h),
                        Text(
                          kcsBasedInKualaLumpur,
                          style: textTheme.headlineLarge
                              ?.copyWith(fontSize: 30.sp),
                        ),
                        gaph(h: 15.h),
                      ],
                    ),
                    Image.asset(
                      'assets/images/profilepic.png',
                      height: 562.w,
                    ),
                    gaphr(),
                    Row(
                      children: socialLinks
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: e.copyWith(row: true, iconWidth: 34.w),
                            ),
                          )
                          .toList(),
                    ),
                    gaphr(),
                    MaterialButton(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
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
                            horizontal: 16.w, vertical: 10.h),
                        child: Row(
                          children: [
                            Text(
                              'View Resume',
                              style: textTheme.bodyMedium?.copyWith(
                                  fontSize: 20.sp,
                                  color: kccSecondary,
                                  fontWeight: kcfbold),
                            ),
                            gapwr(w: 10),
                            const Icon(
                              Icons.contact_page_outlined,
                              color: kccSecondary,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    dataContent(textTheme, kcsWorkingExperience,
                        child: Text(
                          kcsWorkingExperienceContent,
                          style: GoogleFonts.lora(
                            fontSize: 50.sp,
                            fontWeight: kcfmedium,
                            color: kccWhite,
                          ),
                        )),
                    dataContent(textTheme, kcsCompletedProjects,
                        child: Text(
                          kcsCompletedProjectsContent,
                          style: GoogleFonts.lora(
                            fontSize: 50.sp,
                            fontWeight: kcfmedium,
                            color: kccWhite,
                          ),
                        )),
                    dataContent(textTheme, kcsProgrammingSkills,
                        child: SizedBox(
                          width: 234.w,
                          child: Column(
                            children: [
                              skillBar(textTheme, 'Dart', 0.96),
                              skillBar(textTheme, 'Java', 0.94),
                              skillBar(textTheme, 'Python', 0.92),
                              skillBar(textTheme, 'C/C++', 0.91),
                              skillBar(textTheme, 'HTML', 0.92),
                              skillBar(textTheme, 'CSS', 0.91),
                            ],
                          ),
                        )),
                  ],
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
