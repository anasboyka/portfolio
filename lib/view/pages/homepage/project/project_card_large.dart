import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/view/widgets/custom/expanded_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardLarge extends StatefulWidget {
  const ProjectCardLarge({super.key, this.project});

  final ProjectData? project;

  @override
  State<ProjectCardLarge> createState() => _ProjectCardLargeState();
}

class _ProjectCardLargeState extends State<ProjectCardLarge> {
  bool readMore = false;
  PageController controller = PageController(initialPage: 0);
  int activePage = 0;
  double pictureWidth = 610.w;

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return widget.project == null
        ? gaph(h: 480.h)
        : Container(
            constraints: BoxConstraints(maxHeight: 480.h),
            //height: readMore ? null : 480.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: kccOnPrimary,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  child: SizedBox(
                    width: pictureWidth,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView(
                          onPageChanged: (value) {
                            setState(() {
                              activePage = value;
                            });
                          },
                          controller: controller,
                          children: widget.project!.imageUrl
                              .map(
                                (e) => Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                ),
                              )
                              .toList(),
                        ),
                        widget.project!.imageUrl.length != 1
                            ? Positioned(
                                bottom: 50,
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: widget.project!.imageUrl.length,
                                  effect: const JumpingDotEffect(
                                      activeDotColor: kccSecondary,
                                      dotColor: kccSecondary,
                                      strokeWidth: 2,
                                      paintStyle: PaintingStyle.stroke,
                                      verticalOffset: 10),
                                ),
                              )
                            : const SizedBox(),
                        widget.project!.imageUrl.length != 1
                            ? Positioned(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      hoverColor: kccgrey4.withOpacity(0.2),
                                      onPressed: activePage == 0
                                          ? null
                                          : () {
                                              controller.previousPage(
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  curve: Curves.easeInOutCubic);
                                            },
                                      icon: Icon(
                                        Icons.chevron_left,
                                        size: 70,
                                        color: kccgrey1.withOpacity(0.6),
                                      ),
                                    ),
                                    IconButton(
                                      highlightColor: kccgrey4.withOpacity(0.3),
                                      hoverColor: kccgrey5.withOpacity(0.2),
                                      onPressed: activePage ==
                                              widget.project!.imageUrl.length -
                                                  1
                                          ? null
                                          : () {
                                              controller.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  curve: Curves.easeInOutCubic);
                                            },
                                      icon: Icon(
                                        Icons.chevron_right,
                                        size: 70,
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
                  child: LayoutBuilder(builder: (context, constraint) {
                    // final textTheme = Theme.of(context).textTheme;

                    TextStyle chipTextStyle = kcfLBodyMedium();
                    // textTheme.bodyMedium?.copyWith(
                    //         fontWeight: kcfregular, fontSize: 20.sp) ??
                    //     TextStyle(
                    //         fontSize: 20.sp,
                    //         color: kccWhite,
                    //         fontWeight: kcfregular);
                    double contentHorizontalPadding = 50.w;
                    double horizontalSpacing = 10,
                        verticalSpacing = 8,
                        verticalPadding = 5,
                        horizontalPadding = 12;
                    double singleLineHeight = _calculateSingleLineHeight(
                          chipTextStyle,
                        ) +
                        verticalPadding * 2 +
                        verticalSpacing * 2;

                    double totalLineHeight = 0;
                    double totalWidth = 0;

                    List<double> widths = [], chipWidthList = [];
                    List<int> eachLineHaveHowManyItem = [];

                    for (var i = 0; i < widget.project!.techUsed.length; i++) {
                      // for (String chipText in widget.project!.techUsed) {
                      double chipWidth = _calculateChipWidth(
                            widget.project!.techUsed[i],
                            // chipText,
                            chipTextStyle,
                          ) +
                          horizontalSpacing +
                          (horizontalPadding * 2);
                      chipWidthList.add(chipWidth);
                      if (totalWidth + chipWidth + 10 >
                          (constraint.maxWidth -
                              (contentHorizontalPadding * 2))) {
                        totalLineHeight += singleLineHeight;
                        widths.add(totalWidth);
                        eachLineHaveHowManyItem.add(i);
                        totalWidth = 0;
                      }
                      totalWidth += chipWidth;
                      //print(totalLineHeight);
                    }
                    totalLineHeight += singleLineHeight;

                    double maxHeightForThreeLines = singleLineHeight * 3;

                    // print(
                    //     'total line height =  ${totalLineHeight.toStringAsFixed(2)}');
                    // print(
                    //     'max height for 3 line = ${maxHeightForThreeLines.toStringAsFixed(2)}');

                    Wrap wrap = Wrap(
                      spacing: horizontalSpacing,
                      runSpacing: verticalSpacing,
                      children: widget.project!.techUsed
                          .map(
                            (e) => Chip(
                              backgroundColor: kccOnPrimary,
                              label: Text(
                                e,
                              ),
                              labelStyle: chipTextStyle,
                              labelPadding: EdgeInsets.zero,
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding,
                                  vertical: verticalPadding),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          )
                          .toList(),
                    );

                    bool wrapIsOverflowed =
                        totalLineHeight >= maxHeightForThreeLines;
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
                    return SizedBox(
                      height: double.maxFinite,
                      child: readMore || wrapIsOverflowed
                          ? SingleChildScrollView(
                              child: content(
                                wrap,
                                contentHorizontalPadding,
                              ),
                            )
                          : content(
                              wrap,
                              contentHorizontalPadding,
                            ),
                    );
                  }),
                )
              ],
            ),
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
          gaph(h: 24.h),
          Text(
            widget.project!.title,
            style: GoogleFonts.inter(
              fontWeight: kcfbold,
              fontSize: 32.sp,
              color: kccWhite3,
            ),
          ),
          gaph(h: 5),
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
              style: GoogleFonts.inter(
                fontWeight: kcfregular,
                fontSize: 20.sp,
                color: kccWhite3,
              ),
            ),
          ),
          gaph(h: 20.h),

          wrap,
          // Wrap(
          //   spacing: 10,
          //   runSpacing: 8,
          //   children: widget.project!.techUsed
          //       .map(
          //         (e) => Chip(
          //           backgroundColor: kccOnPrimary,
          //           label: Text(
          //             e,
          //           ),
          //           labelStyle:
          //               textTheme.bodyMedium?.copyWith(fontWeight: kcfregular),
          //           labelPadding: EdgeInsets.zero,
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(30)),
          //         ),
          //       )
          //       .toList(),
          // ),

          gaph(h: 24.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.project!.projectLink != null
                  ? SizedBox(
                      height: 40.h,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
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
                          "View Project",
                          style: kcfLBodySmall(),
                          //  textTheme.bodySmall?.copyWith(
                          //     fontWeight: kcfregular, fontSize: 18.sp),
                        ),
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.projectLink != null ? 30.w : 0),
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
                        height: 40.h,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.playStoreLink != null ? 30.w : 0),
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
                        height: 40.h,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.appStoreLink != null ? 30.w : 0),
              widget.project!.projectDemo != null
                  ? SizedBox(
                      height: 40.h,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
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
                          style: kcfLBodySmall(),
                          // textTheme.bodySmall?.copyWith(
                          //     fontWeight: kcfregular, fontSize: 18.sp),
                        ),
                      ),
                    )
                  : gapw(w: 0),
            ],
          ),
          gaph(h: 24),
        ],
      ),
    );
  }

  double _calculateSingleLineHeight(TextStyle textStyle) {
    // Calculate the height of a single line of text using the TextStyle
    final textPainter = TextPainter(
      text: TextSpan(text: 'A', style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.height;
  }

  double _calculateChipWidth(String text, TextStyle textStyle) {
    // Calculate the width of a chip based on the text it contains and the TextStyle
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width; // Adding padding
  }
}
