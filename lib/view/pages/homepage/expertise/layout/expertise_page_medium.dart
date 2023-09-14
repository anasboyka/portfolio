import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';

class ExpertisePageMedium extends StatefulWidget {
  const ExpertisePageMedium({super.key});

  @override
  State<ExpertisePageMedium> createState() => _ExpertisePageMediumState();
}

class _ExpertisePageMediumState extends State<ExpertisePageMedium> {
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
          gaph(h: 40),
          expertiseDesign(Service.mobileApp, 'assets/images/mobile_app_dev.jpg',
              kcsMobileAppDevelopment, kcsMobileAppDevelopmentContent),
          gaph(h: 50),
          expertiseDesign(Service.iot, 'assets/images/iot.jpg',
              kcsInternetOfThings, kcsInternetOfThingsContent),
          gaph(h: 82)
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
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              service == Service.mobileApp
                  ? Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          image,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: kcfLHeadlineSmall(r: false)
                            .copyWith(fontWeight: kcfsemibold),
                      ),
                      gaph(h: 16),
                      Text(
                        content,
                        style: kcfSBodyMedium(),
                      ),
                      gaph(h: 14),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoSegmentedControl<Knowledge>(
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
                                style: kcfSBodyLarge().copyWith(
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
                                style: kcfSBodyLarge().copyWith(
                                    fontWeight: service == Service.mobileApp
                                        ? knowledgeMobile ==
                                                Knowledge.softwareUsed
                                            ? FontWeight.w900
                                            : kcfregular
                                        : knowledgeIot == Knowledge.softwareUsed
                                            ? kcfbold
                                            : kcfregular),
                              ),
                            ),
                          },
                          onValueChanged: (Knowledge value) {
                            setState(() {
                              print(service);
                              print(value);
                              if (service == Service.mobileApp) {
                                knowledgeMobile = value;
                              } else {
                                knowledgeIot = value;
                              }
                            });
                          },
                        ),
                      ),
                      gaph(h: 14),
                      Wrap(
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
                              (e) => Chip(
                                backgroundColor: kccSecondary,
                                label: Text(
                                  e,
                                ),
                                labelStyle: kcfSBodyLarge(),
                                labelPadding: EdgeInsets.zero,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              service == Service.iot
                  ? Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          image,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
