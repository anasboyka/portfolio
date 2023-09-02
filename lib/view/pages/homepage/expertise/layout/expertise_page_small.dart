import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';

class ExpertisePageSmall extends StatefulWidget {
  const ExpertisePageSmall({super.key});

  @override
  State<ExpertisePageSmall> createState() => _ExpertisePageSmallState();
}

class _ExpertisePageSmallState extends State<ExpertisePageSmall> {
  Knowledge knowledgeMobile = Knowledge.skills;
  Knowledge knowledgeIot = Knowledge.skills;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kccOnPrimary,
      child: Column(
        children: [
          gaph(h: 20.h),
          Text('Expertise',
              style:
                  //textTheme.displayLarge?.copyWith(fontSize: 50.sp),
                  kcfLHeadlineSmall().copyWith(fontWeight: kcfbold)),
          Text("My skills and knowledge",
              style: kcfSBodyMedium().copyWith(color: kccgrey1)
              // textTheme.bodyMedium?.copyWith(
              //     color: kccgrey1, fontWeight: kcfregular, fontSize: 20.sp),
              ),
          gaph(h: 16.h),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: IndexedStack(
              key: ValueKey<int>(currentIndex),
              index: currentIndex,
              children: [
                expertiseDesign(
                    Service.mobileApp,
                    'assets/images/mobile_app_dev.jpg',
                    kcsMobileAppDevelopment,
                    kcsMobileAppDevelopmentContent),
                expertiseDesign(Service.iot, 'assets/images/iot.jpg',
                    kcsInternetOfThings, kcsInternetOfThingsContent),
              ],
            ),
          ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              service == Service.mobileApp
                  ? Text(
                      title,
                      style:
                          kcfLTitleMedium().copyWith(fontWeight: kcfsemibold),
                    )
                  : gapw(w: 0),
              service == Service.mobileApp ? const Spacer() : gapw(w: 0),
              IconButton(
                constraints: BoxConstraints(
                  maxHeight: 30.w,
                  maxWidth: 30.w,
                ),
                splashRadius: 20,
                iconSize: 30.w,
                padding: kcaInset0,
                onPressed: () {
                  if (currentIndex == 0) {
                    setState(() {
                      currentIndex = 1;
                    });
                  } else {
                    setState(() {
                      currentIndex = 0;
                    });
                  }
                },
                icon: Icon(
                  service == Service.mobileApp
                      ? CupertinoIcons.chevron_right_circle
                      : CupertinoIcons.chevron_left_circle,
                  color: kccSecondary,
                  size: 30.w,
                ),
              ),
              service == Service.iot ? const Spacer() : gapw(w: 0),
              service == Service.iot
                  ? Text(
                      title,
                      style:
                          kcfLTitleMedium().copyWith(fontWeight: kcfsemibold),
                    )
                  : gapw(w: 0),
            ],
          ),
          gaph(h: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              image,
              width: 390.w,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gaph(h: 14.h),
              Text(
                content,
                style: kcfSBodyMedium().copyWith(fontWeight: kcfmedium),
                // textTheme.bodySmall?.copyWith(fontWeight: kcfregular),
              ),
              gaph(h: 12.h),
              SizedBox(
                width: double.infinity,
                child: CupertinoSegmentedControl<Knowledge>(
                  unselectedColor: kccTransparent,
                  borderColor: kccSecondary,
                  selectedColor: kccSecondary,
                  pressedColor: kccSecondary,
                  groupValue: service == Service.mobileApp
                      ? knowledgeMobile
                      : knowledgeIot,
                  padding: EdgeInsets.zero,
                  children: {
                    Knowledge.skills: Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.h),
                      child: Text(
                        Knowledge.skills.text,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: kccWhite,
                          fontWeight: service == Service.mobileApp
                              ? knowledgeMobile == Knowledge.skills
                                  ? kcfbold
                                  : kcfregular
                              : knowledgeIot == Knowledge.skills
                                  ? kcfbold
                                  : kcfregular,
                        ),
                        // style: kcfSBodyMedium().copyWith(
                        //   fontWeight: service == Service.mobileApp
                        //       ? knowledgeMobile == Knowledge.skills
                        //           ? kcfbold
                        //           : kcfregular
                        //       : knowledgeIot == Knowledge.skills
                        //           ? kcfbold
                        //           : kcfregular,
                        // ),
                      ),
                    ),
                    Knowledge.softwareUsed: Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.h),
                      child: Text(
                        Knowledge.softwareUsed.text,
                        style: GoogleFonts.poppins(
                          color: kccWhite,
                          fontSize: 16.sp,
                          fontWeight: service == Service.mobileApp
                              ? knowledgeMobile == Knowledge.softwareUsed
                                  ? kcfbold
                                  : kcfregular
                              : knowledgeIot == Knowledge.softwareUsed
                                  ? kcfbold
                                  : kcfregular,
                        ),
                        // style: kcfSBodyMedium().copyWith(
                        //   fontWeight: service == Service.mobileApp
                        //       ? knowledgeMobile == Knowledge.softwareUsed
                        //           ? kcfbold
                        //           : kcfregular
                        //       : knowledgeIot == Knowledge.softwareUsed
                        //           ? kcfbold
                        //           : kcfregular,
                        // ),
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
              gaph(h: 22.h),
              Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 7,
                runSpacing: -6,
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
                        labelStyle: kcfSBodyLarge(),
                        // textTheme.bodyLarge?.copyWith(
                        //   fontWeight: kcfregular,
                        //   fontSize: 24.sp,
                        // ),
                        labelPadding: EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 4.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
