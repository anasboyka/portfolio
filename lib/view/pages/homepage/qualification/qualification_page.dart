import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/pages/homepage/qualification/layout/qualification_large.dart';
import 'package:portfolio/view/widgets/layout/adaptive_layout.dart';

class QualificationPage extends StatefulWidget {
  const QualificationPage({super.key});

  @override
  State<QualificationPage> createState() => _QualificationPageState();
}

class _QualificationPageState extends State<QualificationPage> {
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return AdaptiveLayout(bodyLarge: (context, constraint, layout) {
      return const QualificationLarge();
      // return Container(
      //   width: double.maxFinite,
      //   color: kccSecondary,
      //   child: Column(
      //     children: [
      //       gaph(h: 20.h),
      //       Text(
      //         'Qualification',
      //         style: textTheme.displayLarge?.copyWith(fontSize: 50.sp),
      //       ),
      //       Text(
      //         "My Education & experience",
      //         style: textTheme.bodyMedium?.copyWith(
      //             color: kccWhite, fontWeight: kcfregular, fontSize: 20.sp),
      //       ),
      //       gaph(h: 17.h),
      //       Padding(
      //         padding: EdgeInsets.fromLTRB(100.w, 0, 100.w, 0),
      //         child: Container(
      //           color: kccWhite3,
      //           padding: EdgeInsets.only(bottom: 104.w),
      //           width: double.maxFinite,
      //           child: IntrinsicHeight(
      //             child: Row(
      //               children: [
      //                 const Spacer(),
      //                 educationDesign(textTheme),
      //                 const Spacer(),
      //                 Padding(
      //                     padding: EdgeInsets.only(top: 104.w),
      //                     child: Container(
      //                       width: 8,
      //                       color: kccSecondary,
      //                     )),
      //                 const Spacer(),
      //                 experienceDesign(textTheme),
      //                 const Spacer(),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       gaph(h: 128.h)
      //     ],
      //   ),
      // );
    });
  }

  SizedBox experienceDesign(TextTheme textTheme) {
    return SizedBox(
      width: 510.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gaph(h: 44.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Experience',
              style: textTheme.displayMedium?.copyWith(
                  fontWeight: kcfbold, color: kccPrimary, fontSize: 40.sp),
            ),
          ),
          gaph(h: 54.h),
          experienceContent(
            textTheme,
            kcsExperience1Role,
            kcsExperience1Company,
            kcsExperience1Duration,
          ),
          gaph(h: 50.h),
          experienceContent(
            textTheme,
            kcsExperience2Role,
            kcsExperience2Company,
            kcsExperience2Duration,
          ),
          gaph(h: 50.h),
          experienceContent(
            textTheme,
            kcsExperience3Role,
            kcsExperience3Company,
            kcsExperience3Duration,
          ),
          gaph(h: 50.h),
          experienceContent(
            textTheme,
            kcsExperience4Role,
            kcsExperience4Company,
            kcsExperience4Duration,
          ),
          gaph(h: 34.h),
        ],
      ),
    );
  }

  Column experienceContent(
      TextTheme textTheme, String role, String company, String duration) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          role,
          style: textTheme.headlineSmall
              ?.copyWith(color: kccPrimary, fontSize: 28.sp),
        ),
        gaph(h: 12.h),
        Text(
          company,
          style: textTheme.bodyMedium?.copyWith(
              color: kccBlack,
              fontStyle: FontStyle.italic,
              fontWeight: kcfregular,
              fontSize: 20.sp),
        ),
        gaph(h: 12.h),
        Text(
          duration,
          style: textTheme.bodyMedium?.copyWith(
              color: kccblack4, fontWeight: kcfregular, fontSize: 20.sp),
        ),
      ],
    );
  }

  Widget educationDesign(TextTheme textTheme) {
    return SizedBox(
      width: 510.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gaph(h: 44.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Education',
              style: textTheme.displayMedium?.copyWith(
                  fontWeight: kcfbold, color: kccPrimary, fontSize: 40.sp),
            ),
          ),
          gaph(h: 54.h),
          educationContent(
            textTheme,
            kcsEducationDegree,
            kcsEducationDegreeSchool,
            kcsEducationDegreeDuration,
            kcsEducationDegreeResult,
          ),
          gaph(h: 50.h),
          educationContent(
            textTheme,
            kcsEducationDiploma,
            kcsEducationDiplomaSchool,
            kcsEducationDiplomaDuration,
            kcsEducationDiplomaResult,
          ),
          gaph(h: 34.h)
        ],
      ),
    );
  }

  Column educationContent(TextTheme textTheme, String education, String school,
      String duration, String result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          education,
          style: textTheme.headlineSmall
              ?.copyWith(color: kccPrimary, fontSize: 24.sp),
        ),
        gaph(h: 12.h),
        Text(
          school,
          style: textTheme.bodyMedium?.copyWith(
              color: kccBlack,
              fontStyle: FontStyle.italic,
              fontWeight: kcfregular,
              fontSize: 20.sp),
        ),
        gaph(h: 12.h),
        Text(
          duration,
          style: textTheme.bodyMedium?.copyWith(
              color: kccblack4, fontWeight: kcfregular, fontSize: 20.sp),
        ),
        gaph(h: 12.h),
        Text(
          result,
          style:
              textTheme.bodyMedium?.copyWith(color: kccBlack, fontSize: 20.sp),
        ),
      ],
    );
  }
}
