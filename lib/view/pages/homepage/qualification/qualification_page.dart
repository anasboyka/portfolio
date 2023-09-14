import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/pages/homepage/qualification/layout/qualification_large.dart';
import 'package:portfolio/view/pages/homepage/qualification/layout/qualification_small.dart';
import 'package:portfolio/view/widgets/layout/adaptive_layout.dart';

class QualificationPage extends StatefulWidget {
  const QualificationPage({super.key});

  @override
  State<QualificationPage> createState() => _QualificationPageState();
}

class _QualificationPageState extends State<QualificationPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mediumOrSmallMinWidth: 650,
        bodySmall: (context, constraint, screenSize) =>
            const QualificationSmall(),
        bodyMedium: (context, constraint, screenSize) {
          return const QualificationLarge();
        },
        bodyLarge: (context, constraint, layout) {
          return const QualificationLarge();
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
              color: kccBlack4, fontWeight: kcfregular, fontSize: 20.sp),
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
              color: kccBlack4, fontWeight: kcfregular, fontSize: 20.sp),
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
