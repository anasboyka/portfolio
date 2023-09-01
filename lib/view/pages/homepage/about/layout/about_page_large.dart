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
    // final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 1000 - appBarHeight.h,
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
              top: appBarHeight.h + 20.h,
              bottom: appBarHeight.h,
            ), //fromLTRB(100.w, appBarHeight.h, 100.w, 0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //gaph(h: 140.h),
                      dataContent(
                        kcsBiography,
                        content: kcsBioContent,
                      ),
                      //gaph(h: 44.h),
                      dataContent(
                        kcsWhatIDo,
                        content: kcsWhatDoIDoContent,
                      ),
                      //gaph(h: 44.h),
                      dataContent(
                        kcsPreferedLocation,
                        content: kcsPreferedLocationContent,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //gaph(h: 100.h),
                          Text(
                            kcshiImAnas,
                            style: kcfLDisplaySmall()
                                .copyWith(fontWeight: kcfbold),
                            // textTheme.displaySmall
                            //     ?.copyWith(fontSize: 36.sp),
                          ),
                          Text(
                            kcsMobileAppDeveloper,
                            style: kcfLDisplaySmall()
                                .copyWith(fontWeight: kcfbold),
                            // textTheme.displaySmall
                            //     ?.copyWith(fontSize: 36.sp),
                          ),
                          gaph(h: 15.h),
                          Text(kcsBasedInKualaLumpur,
                              style: kcfLHeadlineLarge().copyWith(
                                fontSize: 30.sp,
                                fontWeight: kcfsemibold,
                              )
                              // textTheme.headlineLarge
                              //     ?.copyWith(fontSize: 30.sp),
                              ),
                          gaph(h: 15.h),
                        ],
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            'assets/images/profilepic.png',
                            //height: 562,
                            //fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      gaphr(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: socialLinks
                                .map(
                                  (e) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child:
                                        e.copyWith(row: true, iconWidth: 34.w),
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('View Resume',
                                      style: kcfLBodyMedium().copyWith(
                                        color: kccSecondary,
                                        fontWeight: kcfsemibold,
                                      )
                                      // textTheme.bodyMedium?.copyWith(
                                      //   fontSize: 20.sp,
                                      //   color: kccSecondary,
                                      //   fontWeight: kcfbold,
                                      // ),
                                      ),
                                  gapwr(w: 10),
                                  const Icon(
                                    Icons.contact_page_outlined,
                                    color: kccSecondary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //gaph(h: 140.h),
                      dataContent(kcsWorkingExperience,
                          child: Text(
                            kcsWorkingExperienceContent,
                            style: GoogleFonts.lora(
                              fontSize: 50.sp,
                              fontWeight: kcfmedium,
                              color: kccWhite,
                            ),
                          )),
                      //gaph(h: 44.h),
                      dataContent(kcsCompletedProjects,
                          child: Text(
                            kcsCompletedProjectsContent,
                            style: GoogleFonts.lora(
                              fontSize: 50.sp,
                              fontWeight: kcfmedium,
                              color: kccWhite,
                            ),
                          )),
                      //gaph(h: 44.h),
                      dataContent(kcsProgrammingSkills,
                          child: SizedBox(
                            width: 234.w,
                            child: Column(
                              children: [
                                skillBar('Dart', 0.96),
                                skillBar('Java', 0.94),
                                skillBar('Python', 0.92),
                                skillBar('C/C++', 0.91),
                                skillBar('HTML', 0.92),
                                skillBar('CSS', 0.91),
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row skillBar(String title, double val) {
    return Row(
      children: [
        Expanded(
            child: Text(title,
                style: kcfLBodyMedium().copyWith(fontWeight: kcfsemibold)
                // textTheme.bodySmall
                //     ?.copyWith(fontSize: 18.sp, fontWeight: kcfsemibold),
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

  Column dataContent(String title, {String? content, Widget? child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
              color: kccSecondary, borderRadius: BorderRadius.circular(6.r)),
          child: Text(title,
              style:
                  kcfLBodyMedium() //textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
              ),
        ),
        gaph(h: 15.h),
        child ??
            SizedBox(
              width: 420.w,
              child: Text(
                content ?? '',
                style:
                    kcfLBodySmall(), //textTheme.bodySmall?.copyWith(fontSize: 18.sp),
              ),
            ),
      ],
    );
  }
}
