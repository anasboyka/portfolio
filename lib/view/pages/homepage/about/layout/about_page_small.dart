import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/view/widgets/layout/size_reporting_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/resume_file.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';

import 'package:portfolio/view/widgets/custom/expanded_text.dart';

class AboutPageSmall extends StatefulWidget {
  const AboutPageSmall({super.key, required this.appBarHeight});
  final double appBarHeight;

  @override
  State<AboutPageSmall> createState() => _AboutPageSmallState();
}

class _AboutPageSmallState extends State<AboutPageSmall> {
  TextStyle contentStyle = kcfSBodyMedium();
  int maxMultiline = 4;

  late List<double> _heights;
  double get currentHeight => _heights[currentPageIndex];
  // List<UserDetail> details = [
  //   UserDetail(data: kcsBioContent),
  //   UserDetail(data: kcsWhatDoIDoContent),
  //   UserDetail(data: kcsPreferedLocationContent),
  // ];
  List<bool> readMore = List.generate(4, (index) => false);
  PageController pageController = PageController(keepPage: true);
  double extraHeight = 0;
  int currentPageIndex = 0;
  double scale = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _heights = readMore.map((e) => 0.0).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  // void getChildWidget() {

  // }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(MediaQueryData.fromView(View.of(context)).padding.top);
    return Container(
        width: double.infinity,
        //height: MediaQuery.of(context).size.height + extraHeight,
        //+    kToolbarHeight, // - appBarHeight.h,
        //constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                ColorFilter.mode(kccBlack3.withOpacity(0.8), BlendMode.srcOver),
            image: const AssetImage(
              'assets/images/bg.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child:
            // Stack(
            //   children: [
            // Image.asset(
            //   'assets/images/bg.jpg',
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: double.infinity,
            //   // height: 1117.h - appBarHeight.h, //1117.w - appBarHeight.w,
            // ),
            // Container(
            //   color: kccBlack3.withOpacity(0.8),
            // ),
            Padding(
          padding: EdgeInsets.only(
            top: kToolbarHeight +
                MediaQueryData.fromView(View.of(context)).padding.top,
            bottom: 20,
          ), //fromLTRB(100.w, appBarHeight.h, 100.w, 0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                kcshiImAnas,
                style: kcfLHeadlineSmall().copyWith(
                  fontWeight: kcfbold,
                ),
                // textTheme.displaySmall
                //     ?.copyWith(fontSize: 36.sp),
              ),
              gaph(h: 7.h),
              Text(
                kcsMobileAppDeveloper,
                style: kcfLHeadlineSmall().copyWith(
                  fontWeight: kcfbold,
                ),
                // textTheme.displaySmall
                //     ?.copyWith(fontSize: 36.sp),
              ),
              gaph(h: 13.h),
              Text(kcsBasedInKualaLumpur,
                  style: kcfLTitleSmall().copyWith(
                    fontWeight: kcfsemibold,
                  )
                  // textTheme.headlineLarge
                  //     ?.copyWith(fontSize: 30.sp),
                  ),
              gaph(h: 15.h),
              //Expanded(
              // child:
              SizedBox(
                height: 300.h,
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
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: e.copyWith(row: true, iconWidth: 24.w),
                          ),
                        )
                        .toList(),
                  ),
                  gaph(h: 5.h),
                  MaterialButton(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View Resume',
                            style: kcfLLabelLarge().copyWith(
                                fontWeight: kcfmedium, color: kccSecondary),
                          ),
                          gapw(w: 5.w),
                          Icon(
                            Icons.contact_page_outlined,
                            color: kccSecondary,
                            size: 24.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DefaultTabController(
                length: 4,
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
              gaph(h: 12.h),
              SizedBox(
                height: currentHeight,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: IndexedStack(
                    key: ValueKey<int>(currentPageIndex),
                    index: currentPageIndex,
                    // pageSnapping: false,
                    // controller: pageController,
                    // physics: const NeverScrollableScrollPhysics(),
                    children: sizeReportingChildren
                        .asMap() //
                        .map((index, child) => MapEntry(index, child))
                        .values
                        .toList(),
                  ),
                ),
              ),
              // ExpandablePageView(
              //   pageController: pageController,
              //   onChangedSize: (size) {
              //     print(size.height);
              //     double childHeight = size.height;
              //     double initalHeight =
              //         calculateSingleLineHeight(contentStyle) * maxMultiline;
              //     setState(() {
              //       extraHeight = childHeight - initalHeight;
              //     });
              //   },
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 14.w),
              //       child: ExpandedText(
              //         kcsBioContent,
              //         trimLines: maxMultiline,
              //         isExpanded: readMore[currentPageIndex],
              //         onTapLink: () {
              //           setState(() {
              //             readMore[currentPageIndex] =
              //                 !readMore[currentPageIndex];
              //           });
              //         },
              //         linkColor: kccSecondary,
              //         style: contentStyle,
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 14.w),
              //       child: ExpandedText(
              //         kcsWhatDoIDoContent,
              //         trimLines: maxMultiline,
              //         isExpanded: readMore[currentPageIndex],
              //         onTapLink: () {
              //           setState(() {
              //             readMore[currentPageIndex] =
              //                 !readMore[currentPageIndex];
              //           });
              //         },
              //         linkColor: kccSecondary,
              //         style: contentStyle,
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 14.w),
              //       child: ExpandedText(
              //         kcsPreferedLocationContent,
              //         trimLines: maxMultiline,
              //         isExpanded: readMore[currentPageIndex],
              //         onTapLink: () {
              //           setState(() {
              //             readMore[currentPageIndex] =
              //                 !readMore[currentPageIndex];
              //           });
              //         },
              //         linkColor: kccSecondary,
              //         style: contentStyle,
              //       ),
              //     ),
              //   ],
              // ),
              // Expanded(
              //   flex: 2,
              //  child:
              // SizedBox(
              //   height:
              //       calculateSingleLineHeight(contentStyle) * maxMultiline,
              //   width: double.maxFinite,
              //   child:
              //   PageView(
              //     physics: const NeverScrollableScrollPhysics(),
              //     children: [
              //       ContentExpanded(
              //         data: kcsBioContent,
              //         maxMultiline: maxMultiline,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 14.w),
              //         child: ExpandedText(
              //           kcsWhatDoIDoContent,
              //           trimLines: 3,
              //           isExpanded: false,
              //           onTapLink: () {},
              //           linkColor: kccSecondary,
              //           style: contentStyle,
              //         ),
              //       ),
              //       Container(
              //         color: kccWhite,
              //         height: 300,
              //         width: 200,
              //       ),
              //     ],
              //   ),
              // ),
              // ),
              gaphr(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kcsWorkingExperience.toTitleCase(),
                            style: kcfLTitleSmall().copyWith(
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
                              fontSize: 30.sp,
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
                            style: kcfLTitleSmall().copyWith(
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
                                fontSize: 30.sp,
                                decoration: TextDecoration.underline),
                          ),
                          gaph(h: 30.h),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
        //   ],
        // ),
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
          width: 100.w,
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
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ExpandedText(
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
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ExpandedText(
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
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ExpandedText(
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
          padding: EdgeInsets.symmetric(horizontal: 14.w),
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
      ]
          .asMap()
          .map(
            (index, child) => MapEntry(
              index,
              OverflowBox(
                //needed, so that parent won't impose its constraints on the children, thus skewing the measurement results.
                minHeight: 0,
                maxHeight: double.infinity,
                alignment: Alignment.topCenter,
                child: SizeReportingWidget(
                  onSizeChange: (size) {
                    _heights[index] = size.height;
                    // extraHeight = _heights[index] -
                    //     calculateSingleLineHeight(contentStyle) * 4;
                    setState(() {});
                    print(_heights);
                  },
                  child: Align(child: child),
                ),
              ),
            ),
          )
          .values
          .toList();
}

class UserDetail {
  String data;
  bool readMore;
  UserDetail({
    required this.data,
    this.readMore = false,
  });

  UserDetail copyWith({
    String? data,
    bool? readMore,
  }) {
    return UserDetail(
      data: data ?? this.data,
      readMore: readMore ?? this.readMore,
    );
  }
}
