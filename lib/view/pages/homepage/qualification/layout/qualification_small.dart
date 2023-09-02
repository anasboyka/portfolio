import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:timeline_tile/timeline_tile.dart';

class QualificationSmall extends StatefulWidget {
  const QualificationSmall({super.key});

  @override
  State<QualificationSmall> createState() => _QualificationSmallState();
}

class _QualificationSmallState extends State<QualificationSmall> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kccSecondary,
      width: double.maxFinite,
      child: Column(
        children: [
          gaph(h: 20.h),
          Text('Qualification',
              style:
                  //textTheme.displayLarge?.copyWith(fontSize: 50.sp),
                  kcfLHeadlineSmall().copyWith(fontWeight: kcfbold)),
          Text("My education & experience",
              style: kcfSBodyMedium().copyWith(color: kccWhite)
              // textTheme.bodyMedium?.copyWith(
              //     color: kccgrey1, fontWeight: kcfregular, fontSize: 20.sp),
              ),
          gaph(h: 16.h),
          DefaultTabController(
            length: 2,
            child: TabBar(
              indicatorColor: kccWhite3,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.zero,
              unselectedLabelStyle: kcfLTitleSmall(),
              isScrollable: true,
              labelStyle: kcfLTitleLarge()
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
              labelColor: kccWhite,
              labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
              padding: EdgeInsets.zero,
              dividerColor: kccTransparent,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              tabs: const [
                Tab(
                  child: Text(
                    'Education',
                  ),
                ),
                Tab(
                  child: Text(
                    'Experience',
                  ),
                ),
              ],
            ),
          ),
          gaph(h: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                color: kccWhite3,
                padding: EdgeInsets.only(bottom: 38.w),
                width: double.maxFinite,
                child: IndexedStack(
                  index: currentIndex,
                  children: [
                    educationDesign(),
                    experienceDesign(),
                  ],
                ),
              ),
            ),
          ),
          gaphr(),
        ],
      ),
    );
  }

  Widget experienceDesign() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gaphr(),
          TimelineTile(
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0.1,
              padding: kcaInset0,
              width: 12.w,
              height: 12.w,
              color: kccSecondary,
            ),
            afterLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 50.h),
              child: experienceContent(kcsExperience1Company,
                  kcsExperience1Role, kcsExperience1Duration),
            ),
          ),
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0.1,
              padding: kcaInset0,
              width: 12.w,
              height: 12.w,
              color: kccSecondary,
            ),
            beforeLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            afterLineStyle:
                const LineStyle(color: kccTransparent, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: experienceContent(kcsExperience2Company,
                  kcsExperience2Role, kcsExperience2Duration),
            ),
          ),
        ],
      ),
    );
  }

  Column experienceContent(String role, String company, String duration) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          role,
          style: kcfSBodyLarge()
              .copyWith(color: kccPrimary, fontWeight: kcfsemibold),
          // textTheme.headlineSmall
          //     ?.copyWith(color: kccPrimary, fontSize: 28.sp),
        ),
        gaph(h: 4.h),
        Text(
          company,
          style: kcfSBodyMedium()
              .copyWith(color: kccBlack, fontStyle: FontStyle.italic),
          // textTheme.bodyMedium?.copyWith(
          //     color: kccBlack,
          //     fontStyle: FontStyle.italic,
          //     fontWeight: kcfregular,
          //     fontSize: 20.sp),
        ),
        gaph(h: 4.h),
        Text(duration, style: kcfSBodyMedium().copyWith(color: kccBlack4)
            // textTheme.bodyMedium?.copyWith(
            //     color: kccblack4, fontWeight: kcfregular, fontSize: 20.sp),
            ),
      ],
    );
  }

  Widget educationDesign() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gaphr(),
          TimelineTile(
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0.1,
              padding: kcaInset0,
              width: 12.w,
              height: 12.w,
              color: kccSecondary,
            ),
            afterLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12.w, bottom: 50.h),
              child: educationContent(
                kcsEducationDegree,
                kcsEducationDegreeSchool,
                kcsEducationDegreeDuration,
                kcsEducationDegreeResult,
              ),
            ),
          ),
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0.1,
              padding: kcaInset0,
              width: 12.w,
              height: 12.w,
              color: kccSecondary,
            ),
            beforeLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            afterLineStyle:
                const LineStyle(color: kccTransparent, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: educationContent(
                kcsEducationDiploma,
                kcsEducationDiplomaSchool,
                kcsEducationDiplomaDuration,
                kcsEducationDiplomaResult,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column educationContent(
      String education, String school, String duration, String result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          education,
          style: kcfSBodyLarge()
              .copyWith(color: kccPrimary, fontWeight: kcfsemibold),
          // textTheme.headlineSmall
          //     ?.copyWith(color: kccPrimary, fontSize: 24.sp),
        ),
        gaph(h: 4.h),
        Text(school,
            style: kcfSBodyMedium()
                .copyWith(color: kccBlack, fontStyle: FontStyle.italic)
            // textTheme.bodyMedium?.copyWith(
            //     color: kccBlack,
            //     fontStyle: FontStyle.italic,
            //     fontWeight: kcfregular,
            //     fontSize: 20.sp),
            ),
        gaph(h: 4.h),
        Text(duration, style: kcfSBodyMedium().copyWith(color: kccBlack4)
            // textTheme.bodyMedium?.copyWith(
            //     color: kccblack4, fontWeight: kcfregular, fontSize: 20.sp),
            ),
        gaph(h: 4.h),
        Text(result,
            style: kcfSBodyMedium()
                .copyWith(color: kccBlack, fontWeight: kcfmedium)
            // textTheme.bodyMedium?.copyWith(color: kccBlack, fontSize: 20.sp),
            ),
      ],
    );
  }
}
