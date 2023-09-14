import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          gaph(h: 20),
          Text('Expertise',
              style: kcfLHeadlineSmall(r: false).copyWith(fontWeight: kcfbold)),
          Text("My skills and knowledge",
              style: kcfSBodyMedium().copyWith(color: kccgrey1)),
          gaph(h: 16),
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              service == Service.mobileApp
                  ? Text(
                      title,
                      style: kcfLTitleMedium(r: false)
                          .copyWith(fontWeight: kcfsemibold),
                    )
                  : gapw(w: 0),
              service == Service.mobileApp ? const Spacer() : gapw(w: 0),
              IconButton(
                constraints: const BoxConstraints(
                  maxHeight: 30,
                  maxWidth: 30,
                ),
                splashRadius: 20,
                iconSize: 30,
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
                  size: 30,
                ),
              ),
              service == Service.iot ? const Spacer() : gapw(w: 0),
              service == Service.iot
                  ? Text(
                      title,
                      style: kcfLTitleMedium(r: false)
                          .copyWith(fontWeight: kcfsemibold),
                    )
                  : gapw(w: 0),
            ],
          ),
          gaph(h: 16),
          SizedBox(
            width: double.maxFinite,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gaph(h: 14),
              Text(
                content,
                style: kcfSBodyMedium().copyWith(fontWeight: kcfmedium),
              ),
              gaph(h: 12),
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
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        Knowledge.skills.text,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: kccWhite,
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
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        Knowledge.softwareUsed.text,
                        style: GoogleFonts.poppins(
                          color: kccWhite,
                          fontSize: 16,
                          fontWeight: service == Service.mobileApp
                              ? knowledgeMobile == Knowledge.softwareUsed
                                  ? kcfbold
                                  : kcfregular
                              : knowledgeIot == Knowledge.softwareUsed
                                  ? kcfbold
                                  : kcfregular,
                        ),
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
              gaph(h: 22),
              Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 7,
                runSpacing: 10,
                children: (service == Service.mobileApp
                        ? knowledgeMobile == Knowledge.skills
                            ? kcsLChipMobileAppDevSkills
                            : kcsLChipMobileAppDevSoftware
                        : knowledgeIot == Knowledge.skills
                            ? kcsLChipIotSkills
                            : kcsLChipIotSoftware)
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kccSecondary),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Text(
                          e,
                          style: kcfSBodyLarge(),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          gaph(h: 20)
        ],
      ),
    );
  }
}
