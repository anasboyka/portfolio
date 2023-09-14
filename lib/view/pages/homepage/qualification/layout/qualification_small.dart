import 'package:flutter/material.dart';

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
          gaph(h: 20),
          Text('Qualification',
              style:
                  
                  kcfLHeadlineSmall(r: false).copyWith(fontWeight: kcfbold)),
          Text("My education & experience",
              style: kcfSBodyMedium().copyWith(color: kccWhite)
              
              
              ),
          gaph(h: 16),
          DefaultTabController(
            length: 2,
            child: TabBar(
              indicatorColor: kccWhite3,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.zero,
              unselectedLabelStyle: kcfLTitleSmall(r: false),
              isScrollable: true,
              labelStyle: kcfLTitleLarge(r: false)
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              labelColor: kccWhite,
              labelPadding: EdgeInsets.symmetric(horizontal: 25),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: kccWhite3,
                padding: EdgeInsets.only(bottom: 38),
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
      padding: EdgeInsets.symmetric(horizontal: 20),
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
              width: 12,
              height: 12,
              color: kccSecondary,
            ),
            afterLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12, bottom: 50),
              child: experienceContent(kcsExperience1Company,
                  kcsExperience1Role, kcsExperience1Duration),
            ),
          ),
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0.1,
              padding: kcaInset0,
              width: 12,
              height: 12,
              color: kccSecondary,
            ),
            beforeLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            afterLineStyle:
                const LineStyle(color: kccTransparent, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12),
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
          
          
        ),
        gaph(h: 4),
        Text(
          company,
          style: kcfSBodyMedium()
              .copyWith(color: kccBlack, fontStyle: FontStyle.italic),
          
          
          
          
          
        ),
        gaph(h: 4),
        Text(duration, style: kcfSBodyMedium().copyWith(color: kccBlack4)
            
            
            ),
      ],
    );
  }

  Widget educationDesign() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
              width: 12,
              height: 12,
              color: kccSecondary,
            ),
            afterLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12, bottom: 50),
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
              width: 12,
              height: 12,
              color: kccSecondary,
            ),
            beforeLineStyle: const LineStyle(color: kccSecondary, thickness: 4),
            afterLineStyle:
                const LineStyle(color: kccTransparent, thickness: 4),
            alignment: TimelineAlign.start,
            axis: TimelineAxis.vertical,
            endChild: Padding(
              padding: EdgeInsets.only(left: 12),
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
          
          
        ),
        gaph(h: 4),
        Text(school,
            style: kcfSBodyMedium()
                .copyWith(color: kccBlack, fontStyle: FontStyle.italic)
            
            
            
            
            
            ),
        gaph(h: 4),
        Text(duration, style: kcfSBodyMedium().copyWith(color: kccBlack4)
            
            
            ),
        gaph(h: 4),
        Text(result,
            style: kcfSBodyMedium()
                .copyWith(color: kccBlack, fontWeight: kcfmedium)
            
            ),
      ],
    );
  }
}
