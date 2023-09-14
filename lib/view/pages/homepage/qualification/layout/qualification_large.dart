import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';

class QualificationLarge extends StatelessWidget {
  const QualificationLarge({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.maxFinite,
      color: kccSecondary,
      child: Column(
        children: [
          gaph(h: 20.h),
          Text('Qualification',
              style: kcfLDisplayLarge().copyWith(fontWeight: kcfbold)
              
              ),
          Text("My Education & experience", style: kcfLBodyMedium()
              
              
              ),
          gaph(h: 17.h),
          Padding(
            padding: EdgeInsets.fromLTRB(100.w, 0, 100.w, 0),
            child: Container(
              color: kccWhite3,
              padding: EdgeInsets.only(bottom: 104.w),
              width: double.maxFinite,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const Spacer(),
                    educationDesign(),
                    const Spacer(),
                    Padding(
                        padding: EdgeInsets.only(top: 104.w),
                        child: Container(
                          width: 8,
                          color: kccSecondary,
                        )),
                    const Spacer(),
                    experienceDesign(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          gaph(h: 128.h)
        ],
      ),
    );
  }

  SizedBox experienceDesign() {
    return SizedBox(
      width: 510.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gaph(h: 44.h),
          Align(
            alignment: Alignment.center,
            child: Text('Experience',
                style: kcfLDisplayMedium()
                    .copyWith(color: kccPrimary, fontWeight: kcfbold)
                
                
                ),
          ),
          gaph(h: 54.h),
          experienceContent(
            kcsExperience1Role,
            kcsExperience1Company,
            kcsExperience1Duration,
          ),
          gaph(h: 50.h),
          experienceContent(
            kcsExperience2Role,
            kcsExperience2Company,
            kcsExperience2Duration,
          ),
          gaph(h: 50.h),
          experienceContent(
            kcsExperience3Role,
            kcsExperience3Company,
            kcsExperience3Duration,
          ),
          gaph(h: 50.h),
          experienceContent(
            kcsExperience4Role,
            kcsExperience4Company,
            kcsExperience4Duration,
          ),
          gaph(h: 34.h),
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
          style: kcfLHeadlineMedium().copyWith(color: kccPrimary),
          
          
        ),
        gaph(h: 12.h),
        Text(
          company,
          style: kcfLBodyMedium()
              .copyWith(color: kccBlack, fontStyle: FontStyle.italic),
          
          
          
          
          
        ),
        gaph(h: 12.h),
        Text(duration, style: kcfLBodyMedium().copyWith(color: kccBlack4)
            
            
            ),
      ],
    );
  }

  Widget educationDesign() {
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
              style: kcfLDisplayMedium().copyWith(color: kccPrimary),
              
              
            ),
          ),
          gaph(h: 54.h),
          educationContent(
            kcsEducationDegree,
            kcsEducationDegreeSchool,
            kcsEducationDegreeDuration,
            kcsEducationDegreeResult,
          ),
          gaph(h: 50.h),
          educationContent(
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

  Column educationContent(
      String education, String school, String duration, String result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          education,
          style: kcfLHeadlineSmall()
              .copyWith(color: kccPrimary, fontWeight: kcfsemibold),
          
          
        ),
        gaph(h: 12.h),
        Text(school,
            style: kcfLBodyMedium()
                .copyWith(color: kccBlack, fontStyle: FontStyle.italic)
            
            
            
            
            
            ),
        gaph(h: 12.h),
        Text(duration, style: kcfLBodyMedium().copyWith(color: kccBlack4)
            
            
            ),
        gaph(h: 12.h),
        Text(result, style: kcfLBodyMedium().copyWith(color: kccBlack)
            
            ),
      ],
    );
  }
}
