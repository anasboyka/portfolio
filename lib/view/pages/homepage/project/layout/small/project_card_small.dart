import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/view/widgets/custom/expanded_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardSmall extends StatefulWidget {
  const ProjectCardSmall({super.key, this.project, this.autoPlay = false});
  final ProjectData? project;
  final bool autoPlay;

  @override
  State<ProjectCardSmall> createState() => _ProjectCardSmallState();
}

class _ProjectCardSmallState extends State<ProjectCardSmall> {
  bool readMore = false, autoPlay = false;
  CarouselController carouselController = CarouselController();
  PageController descPageController = PageController(initialPage: 0);
  int activeImage = 0, activeDescription = 0;
  int autoplayDuration = 4;

  @override
  void initState() {
    autoPlay = widget.autoPlay;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 330.h),
      //height: readMore ? null : 480.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: kccOnPrimary,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: SizedBox(
              height: 178.h,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider(
                    items: widget.project!.imageUrl
                        .map(
                          (e) => Image.network(
                            e,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 178.h,
                      viewportFraction: 1,
                      autoPlay: autoPlay,
                      autoPlayInterval: Duration(seconds: autoplayDuration),
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeImage = index;
                        });
                        print(autoplayDuration);
                      },
                    ),
                  ),
                  widget.project!.imageUrl.length != 1
                      ? Positioned(
                          bottom: 10.h,
                          child: AnimatedSmoothIndicator(
                            onDotClicked: (index) {
                              carouselController.animateToPage(index);
                            },
                            activeIndex: activeImage,
                            //controller: imagePageController,
                            count: widget.project!.imageUrl.length,
                            effect: WormEffect(
                              dotWidth: 12.w,
                              dotHeight: 12.w,
                              activeDotColor: kccSecondary,
                              dotColor: kccSecondary,
                              strokeWidth: 1,
                              type: WormType.normal,
                              paintStyle: PaintingStyle.stroke,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  widget.project!.imageUrl.length != 1
                      ? Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                padding: kcaInset0,
                                constraints: BoxConstraints(
                                  maxHeight: 48.w,
                                  maxWidth: 48.w,
                                ),
                                iconSize: 48.w,
                                hoverColor: kccgrey4.withOpacity(0.2),
                                onPressed: activeImage == 0
                                    ? null
                                    : () async {
                                        setState(() {
                                          autoPlay = false;
                                        });
                                        carouselController.previousPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeInOutCubic);
                                        await Future.delayed(
                                            const Duration(seconds: 8));
                                        setState(() {
                                          autoPlay = true;
                                        });
                                      },
                                icon: Icon(
                                  Icons.chevron_left,
                                  size: 48.w,
                                  color: kccgrey1.withOpacity(0.6),
                                ),
                              ),
                              IconButton(
                                padding: kcaInset0,
                                constraints: BoxConstraints(
                                  maxHeight: 48.w,
                                  maxWidth: 48.w,
                                ),
                                iconSize: 48.w,
                                highlightColor: kccgrey4.withOpacity(0.3),
                                hoverColor: kccgrey5.withOpacity(0.2),
                                onPressed: activeImage ==
                                        widget.project!.imageUrl.length - 1
                                    ? null
                                    : () async {
                                        setState(() {
                                          autoPlay = false;
                                        });
                                        carouselController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeInOutCubic);
                                        await Future.delayed(
                                            const Duration(seconds: 8));
                                        if (mounted) {
                                          setState(() {
                                            autoPlay = true;
                                          });
                                        }
                                      },
                                icon: Icon(
                                  Icons.chevron_right,
                                  size: 48,
                                  color: kccgrey1.withOpacity(0.8),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, contentConstraint) {
              TextStyle chipTextStyle = kcfSBodySmall();

              double contentHorizontalPadding = 6.w;
              double horizontalSpacing = 6.w,
                  verticalSpacing = 4,
                  verticalPadding = 2,
                  horizontalPadding = 6;
              Wrap wrap = Wrap(
                spacing: horizontalSpacing,
                runSpacing: verticalSpacing,
                children: widget.project!.techUsed
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kccOnPrimary,
                            border: Border.all(
                              color: kccSecondary,
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: verticalPadding),
                          child: Text(e, style: chipTextStyle),
                        ),
                      ),
                    )
                    .toList(),
              );
              // print(
              //     'wrap constraint width= ${constraint.maxWidth - contentHorizontalPadding * 2}');
              // print('whole width = $wholeWidth');
              // print('item length = ${widget.project!.techUsed.length}');
              // print(widths);
              // print(eachLineHaveHowManyItem);
              // print(chipWidthList);
              // print('wrap is 3 line =  $wrapIsOverflowed');
              // print('single line height = $singleLineHeight');
              // print('totalheight = $totalLineHeight');

              int maxLines = 5;
              final descSpan = TextSpan(
                text: widget.project!.description,
                style: kcfSBodySmall(),
              );
              final tp = TextPainter(
                text: descSpan,
                textDirection: TextDirection.ltr,
              );
              tp.layout(maxWidth: contentConstraint.maxWidth);
              // int descCurrentLine = tp.computeLineMetrics().length;
              // debugPrint(descCurrentLine.toString());
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: contentHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gaph(h: 7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(widget.project!.title,
                              style: kcfSBodyMedium().copyWith(
                                fontWeight: kcfbold,
                              )),
                        ),
                        activeDescription == 0
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    activeDescription = 1;
                                  });
                                  descPageController.animateToPage(
                                    activeDescription,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOutCubic,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Tech Used',
                                      style: kcfSBodySmall().copyWith(
                                          color: kccSecondary,
                                          fontWeight: kcfbold),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 24.w,
                                      color: kccSecondary,
                                    ),
                                  ],
                                ),
                              )
                            : gaph(h: 0)
                      ],
                    ),
                    gaph(h: 4.h),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: descPageController,
                        children: [
                          SingleChildScrollView(
                            child: projectDescription(maxLines),
                          ),
                          Row(
                            children: [
                              Material(
                                color: kccTransparent,
                                child: IconButton(
                                  constraints: BoxConstraints(
                                      maxWidth: 32.w, maxHeight: 32.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 4.w),
                                  splashRadius: 12.w,
                                  iconSize: 24.w,
                                  onPressed: () {
                                    setState(() {
                                      activeDescription = 0;
                                    });
                                    descPageController.animateToPage(
                                        activeDescription,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOutCubic);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.chevron_left_circle,
                                    size: 24.w,
                                    color: kccSecondary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: wrap,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    gaph(h: 2.h),
                    Container(
                      height: 1,
                      color: kccgrey3,
                    ),
                    gaph(h: 4.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.project!.projectLink != null
                            ? SizedBox(
                                height: 24.h,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    // side: BorderSide(color: kccSecondary),
                                  ),
                                  color: kccSecondary,
                                  onPressed: () async {
                                    final Uri url =
                                        Uri.parse(widget.project!.projectLink!);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    }
                                  },
                                  child: Text(
                                    "View",
                                    style: kcfSBodySmall(),
                                    //  textTheme.bodySmall?.copyWith(
                                    //     fontWeight: kcfregular, fontSize: 18.sp),
                                  ),
                                ),
                              )
                            : gapw(w: 0),
                        gapw(w: widget.project!.projectLink != null ? 18.w : 0),
                        widget.project!.playStoreLink != null
                            ? InkWell(
                                onTap: () async {
                                  final Uri url =
                                      Uri.parse(widget.project!.playStoreLink!);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Image.asset(
                                  "assets/icon/4x/ic_google_play_4x.png",
                                  height: 24.h,
                                ),
                              )
                            : gapw(w: 0),
                        gapw(
                            w: widget.project!.playStoreLink != null
                                ? 18.w
                                : 0),
                        widget.project!.appStoreLink != null
                            ? InkWell(
                                onTap: () async {
                                  final Uri url =
                                      Uri.parse(widget.project!.appStoreLink!);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Image.asset(
                                  "assets/icon/4x/ic_app_store_4x.png",
                                  height: 24.h,
                                ),
                              )
                            : gapw(w: 0),
                        gapw(
                            w: widget.project!.appStoreLink != null ? 18.w : 0),
                        widget.project!.projectDemo != null
                            ? SizedBox(
                                height: 24.h,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    // side: BorderSide(color: kccSecondary),
                                  ),
                                  color: kccSecondary,
                                  onPressed: () async {
                                    final Uri url =
                                        Uri.parse(widget.project!.projectDemo!);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    }
                                  },
                                  child: Text(
                                    "Project Video",
                                    style: kcfSBodySmall(),
                                    // textTheme.bodySmall?.copyWith(
                                    //     fontWeight: kcfregular, fontSize: 18.sp),
                                  ),
                                ),
                              )
                            : gapw(w: 0),
                      ],
                    ),
                    gaph(h: 10.h)
                  ],
                ),
              );
              // return SizedBox(
              //   height: double.maxFinite,
              //   child: readMore || wrapIsOverflowed
              //       ? SingleChildScrollView(
              //           child: content(
              //             wrap,
              //             contentHorizontalPadding,
              //           ),
              //         )
              //       : content(
              //           wrap,
              //           contentHorizontalPadding,
              //         ),
              // );
            }),
          )
        ],
      ),
    );
  }

  Widget projectDescription(int maxLines) {
    return ExpandedText(
      onTapLink: () {
        setState(() {
          readMore = !readMore;
        });
      },
      isExpanded: readMore,
      // callback: onExpand,
      // (val) {
      //   print('readmore b4 set = $readMore');
      //   setState(() {
      //     readMore = !val;
      //   });
      //   print('readmore after set = $readMore');
      // },
      trimLines: maxLines,
      trimCollapsedText: "Show more",
      trimExpandedText: "Show less",
      // trimMode: TrimMode.Line,
      widget.project!.description,
      style: kcfSBodySmall(),
    );
  }

  Padding content(Widget wrap, double contentHorizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: contentHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            readMore ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
        children: [
          gaph(h: 7.h),
          Text(widget.project!.title,
              style: kcfSBodyMedium().copyWith(
                fontWeight: kcfbold,
              )),
          gaph(h: 4.h),
          RepaintBoundary(
            child: ExpandedText(
              onTapLink: () {
                setState(() {
                  readMore = !readMore;
                });
              },
              isExpanded: readMore,
              // callback: onExpand,
              // (val) {
              //   print('readmore b4 set = $readMore');
              //   setState(() {
              //     readMore = !val;
              //   });
              //   print('readmore after set = $readMore');
              // },
              trimLines: 3,
              trimCollapsedText: "Show more",
              trimExpandedText: "Show less",
              // trimMode: TrimMode.Line,
              widget.project!.description,
              style: kcfSBodySmall(),
            ),
          ),

          //wrap,

          gaph(h: 7.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.project!.projectLink != null
                  ? SizedBox(
                      height: 24.h,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          // side: BorderSide(color: kccSecondary),
                        ),
                        color: kccSecondary,
                        onPressed: () async {
                          final Uri url =
                              Uri.parse(widget.project!.projectLink!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Text(
                          "View",
                          style: kcfSBodySmall(),
                          //  textTheme.bodySmall?.copyWith(
                          //     fontWeight: kcfregular, fontSize: 18.sp),
                        ),
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.projectLink != null ? 18.w : 0),
              widget.project!.playStoreLink != null
                  ? InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icon/4x/ic_google_play_4x.png",
                        height: 24.h,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.playStoreLink != null ? 18.w : 0),
              widget.project!.playStoreLink != null
                  ? InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icon/4x/ic_app_store_4x.png",
                        height: 24.h,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.appStoreLink != null ? 18.w : 0),
              widget.project!.projectDemo != null
                  ? SizedBox(
                      height: 24.h,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          // side: BorderSide(color: kccSecondary),
                        ),
                        color: kccSecondary,
                        onPressed: () async {
                          final Uri url =
                              Uri.parse(widget.project!.projectDemo!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Text(
                          "Project Video",
                          style: kcfSBodySmall(),
                          // textTheme.bodySmall?.copyWith(
                          //     fontWeight: kcfregular, fontSize: 18.sp),
                        ),
                      ),
                    )
                  : gapw(w: 0),
            ],
          ),
        ],
      ),
    );
  }
}
