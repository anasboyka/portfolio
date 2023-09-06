import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:portfolio/view/widgets/layout/size_reporting_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/resume_file.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';

import 'package:portfolio/view/widgets/custom/expanded_text.dart';

class AboutPageSmall extends StatefulWidget {
  const AboutPageSmall({
    super.key,
  });

  @override
  State<AboutPageSmall> createState() => _AboutPageSmallState();
}

class _AboutPageSmallState extends State<AboutPageSmall> {
  TextStyle contentStyle = kcfSBodyMedium();
  int maxMultiline = 4;

  List<bool> readMore = List.generate(4, (index) => false);
  PageController pageController = PageController(keepPage: true);
  double extraHeight = 0;
  int currentPageIndex = 0;
  double scale = 0;

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(MediaQueryData.fromView(View.of(context)).padding.top);
    return IntrinsicHeight(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              // height: 1117.h - appBarHeight.h, //1117.w - appBarHeight.w,
            ),
          ),
          Container(
            color: kccBlack3.withOpacity(0.8),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: kToolbarHeight +
                  MediaQueryData.fromView(View.of(context)).padding.top,
              bottom: 20,
            ), //fromLTRB(100.w, appBarHeight.h, 100.w, 0),
            child:
                //  widget.layout == Layout.medium
                //     ? SizedBox()
                //     :
                Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      kcshiImAnas,
                      style: kcfLHeadlineSmall(r: false).copyWith(
                        fontWeight: kcfbold,
                      ),
                      // textTheme.displaySmall
                      //     ?.copyWith(fontSize: 36.sp),
                    ),
                    gaph(h: 7),
                    Text(
                      kcsMobileAppDeveloper,
                      style: kcfLHeadlineSmall(r: false).copyWith(
                        fontWeight: kcfbold,
                      ),
                      // textTheme.displaySmall
                      //     ?.copyWith(fontSize: 36.sp),
                    ),
                    gaph(h: 13),
                    Text(kcsBasedInKualaLumpur,
                        style: kcfLTitleSmall(r: false).copyWith(
                          fontWeight: kcfsemibold,
                        )
                        // textTheme.headlineLarge
                        //     ?.copyWith(fontSize: 30.sp),
                        ),
                    gaph(h: 15),
                    //Expanded(
                    // child:
                    SizedBox(
                      height: 300,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/profilepic.png',
                          //height: 562,
                          //fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: socialLinks
                              .map(
                                (e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: e.copyWith(row: true, iconWidth: 24),
                                ),
                              )
                              .toList(),
                        ),
                        gaph(h: 5),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'View Resume',
                                  style: kcfLLabelLarge(r: false).copyWith(
                                      fontWeight: kcfmedium,
                                      color: kccSecondary),
                                ),
                                gapw(w: 5),
                                const Icon(
                                  Icons.contact_page_outlined,
                                  color: kccSecondary,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                DefaultTabController(
                  length: 4,
                  child: TabBar(
                    indicatorColor: kccWhite3,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.zero,
                    unselectedLabelStyle: kcfLTitleSmall(r: false),
                    isScrollable: true,
                    labelStyle: kcfLTitleLarge(r: false)
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    labelColor: kccWhite,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.zero,
                    dividerColor: kccTransparent,
                    onTap: (value) {
                      setState(() {
                        currentPageIndex = value;
                        scale = 0;
                      });
                      // pageController.animateToPage(value,
                      //     duration: const Duration(milliseconds: 200),
                      //     curve: Curves.easeInOutCubic);
                    },
                    tabs: const [
                      Tab(
                        child: Text(
                          'Biography',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'What I Do',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Prefered Location',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Programming skills',
                        ),
                      ),
                    ],
                  ),
                ),
                gaph(h: 12),
                SizedBox(
                  height:
                      calculateSingleLineHeight(contentStyle) * maxMultiline +
                          20,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: IndexedStack(
                        key: ValueKey<int>(currentPageIndex),
                        index: currentPageIndex,
                        // pageSnapping: false,
                        // controller: pageController,
                        // physics: const NeverScrollableScrollPhysics(),
                        children: sizeReportingChildren
                        // .asMap() //
                        // .map((index, child) => MapEntry(index, child))
                        // .values
                        // .toList(),
                        ),
                  ),
                ),
                gaphr(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              kcsWorkingExperience.toTitleCase(),
                              style: kcfLTitleSmall(r: false).copyWith(
                                fontWeight: FontWeight.bold,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            gaphr(),
                            Text(
                              kcsWorkingExperienceContent,
                              style: GoogleFonts.lora(
                                color: kccWhite,
                                fontWeight: kcfmedium,
                                fontSize: 30,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              kcsCompletedProjects.toTitleCase(),
                              style: kcfLTitleSmall(r: false).copyWith(
                                fontWeight: FontWeight.bold,
                                // fontSize: 22.sp,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            gaphr(),
                            Text(
                              kcsCompletedProjectsContent,
                              style: GoogleFonts.lora(
                                  color: kccWhite,
                                  fontWeight: kcfmedium,
                                  fontSize: 30,
                                  decoration: TextDecoration.underline),
                            ),
                            gaph(h: 30),
                          ],
                        ),
                      ),
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
                style: kcfSBodyMedium().copyWith(fontWeight: kcfsemibold)
                // textTheme.bodySmall
                //     ?.copyWith(fontSize: 18.sp, fontWeight: kcfsemibold),
                )),
        SizedBox(
          width: 100,
          child: LinearProgressIndicator(
            value: val,
            color: kccSecondary,
            backgroundColor: kccWhite3,
          ),
        )
      ],
    );
  }

  List<Widget> get sizeReportingChildren => [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ExpandedText(
            key: UniqueKey(),
            kcsBioContent,
            trimLines: maxMultiline,
            isExpanded: readMore[currentPageIndex],
            onTapLink: () {
              setState(() {
                readMore[currentPageIndex] = !readMore[currentPageIndex];
              });
            },
            linkColor: kccSecondary,
            style: contentStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ExpandedText(
            key: UniqueKey(),
            kcsWhatDoIDoContent,
            trimLines: maxMultiline,
            isExpanded: readMore[currentPageIndex],
            onTapLink: () {
              setState(() {
                readMore[currentPageIndex] = !readMore[currentPageIndex];
              });
            },
            linkColor: kccSecondary,
            style: contentStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ExpandedText(
            key: UniqueKey(),
            kcsPreferedLocationContent,
            trimLines: maxMultiline,
            isExpanded: readMore[currentPageIndex],
            onTapLink: () {
              setState(() {
                readMore[currentPageIndex] = !readMore[currentPageIndex];
              });
            },
            linkColor: kccSecondary,
            style: contentStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    skillBar('Dart', 0.96),
                    skillBar('Java', 0.94),
                    skillBar('Python', 0.92),
                  ],
                ),
              ),
              gapwr(),
              Expanded(
                child: Column(
                  children: [
                    skillBar('C/C++', 0.91),
                    skillBar('HTML', 0.92),
                    skillBar('CSS', 0.91),
                  ],
                ),
              ),
            ],
          ),
        )
      ];
}
