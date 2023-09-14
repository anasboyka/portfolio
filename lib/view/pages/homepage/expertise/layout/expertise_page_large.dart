import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';

class ExpertisePageLarge extends StatefulWidget {
  const ExpertisePageLarge({super.key});

  @override
  State<ExpertisePageLarge> createState() => _ExpertisePageLargeState();
}

class _ExpertisePageLargeState extends State<ExpertisePageLarge> {
  Knowledge knowledgeMobile = Knowledge.skills;
  Knowledge knowledgeIot = Knowledge.skills;
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return Container(
      color: kccOnPrimary,
      child: Column(
        children: [
          gaph(h: 20.h),
          Text('Expertise',
              style:
                  //textTheme.displayLarge?.copyWith(fontSize: 50.sp),
                  kcfLDisplayLarge().copyWith(fontWeight: kcfbold)),
          Text("My skills and knowledge",
              style: kcfLBodyMedium().copyWith(color: kccgrey1)
              // textTheme.bodyMedium?.copyWith(
              //     color: kccgrey1, fontWeight: kcfregular, fontSize: 20.sp),
              ),
          gaph(h: 50.h),
          expertiseDesign(Service.mobileApp, 'assets/images/mobile_app_dev.jpg',
              kcsMobileAppDevelopment, kcsMobileAppDevelopmentContent),
          gaph(h: 108),
          expertiseDesign(Service.iot, 'assets/images/iot.jpg',
              kcsInternetOfThings, kcsInternetOfThingsContent),
          gaph(h: 82.h)
        ],
      ),
    );
  }

  Widget expertiseDesign(
    Service service,
    String image,
    String title,
    String content,
  ) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            service == Service.mobileApp
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      image,
                      width: 584.w,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              width: 844.w,
              child: Builder(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          kcfLDisplayMedium().copyWith(fontWeight: kcfsemibold),
                      // textTheme.displayMedium
                      //     ?.copyWith(fontWeight: kcfsemibold, fontSize: 40.sp),
                    ),
                    gaph(h: 14.h),
                    Text(
                      content,
                      style: kcfLBodyLarge(),
                      // textTheme.bodySmall?.copyWith(fontWeight: kcfregular),
                    ),
                    gaph(h: 40.h),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoSegmentedControl<Knowledge>(
                        borderColor: kccSecondary,
                        selectedColor: kccSecondary,
                        pressedColor: kccSecondary,
                        unselectedColor: kccTransparent,
                        groupValue: service == Service.mobileApp
                            ? knowledgeMobile
                            : knowledgeIot,
                        padding: EdgeInsets.zero,
                        children: {
                          Knowledge.skills: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              Knowledge.skills.text,
                              style:

                                  // textTheme.bodyLarge?.copyWith(
                                  kcfLBodyLarge().copyWith(
                                fontWeight: service == Service.mobileApp
                                    ? knowledgeMobile == Knowledge.skills
                                        ? kcfbold
                                        : kcfregular
                                    : knowledgeIot == Knowledge.skills
                                        ? kcfbold
                                        : kcfregular,
                              ),
                            ),
                          ),
                          Knowledge.softwareUsed: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              Knowledge.softwareUsed.text,
                              style: kcfLBodyLarge().copyWith(
                                  // textTheme.bodyLarge?.copyWith(
                                  fontSize: 24.sp,
                                  fontWeight: service == Service.mobileApp
                                      ? knowledgeMobile ==
                                              Knowledge.softwareUsed
                                          ? kcfbold
                                          : kcfregular
                                      : knowledgeIot == Knowledge.softwareUsed
                                          ? kcfbold
                                          : kcfregular),
                            ),
                          ),
                        },
                        onValueChanged: (Knowledge value) {
                          setState(() {
                            if (service == Service.mobileApp) {
                              knowledgeMobile = value;
                            } else {
                              knowledgeIot = value;
                            }
                          });
                        },
                      ),
                    ),
                    gaph(h: 40.h),
                    Wrap(
                      spacing: 16,
                      runSpacing: 14,
                      children: (service == Service.mobileApp
                              ? knowledgeMobile == Knowledge.skills
                                  ? kcsLChipMobileAppDevSkills
                                  : kcsLChipMobileAppDevSoftware
                              : knowledgeIot == Knowledge.skills
                                  ? kcsLChipIotSkills
                                  : kcsLChipIotSoftware)
                          .map(
                            (e) => Chip(
                              backgroundColor: kccSecondary,
                              label: Text(
                                e,
                              ),
                              labelStyle: kcfLBodyLarge(),
                              // textTheme.bodyLarge?.copyWith(
                              //   fontWeight: kcfregular,
                              //   fontSize: 24.sp,
                              // ),
                              labelPadding: EdgeInsets.zero,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 7.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                );
              }),
            ),
            service == Service.iot
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      image,
                      width: 584.w,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
