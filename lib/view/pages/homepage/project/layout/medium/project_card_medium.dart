import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/view/widgets/custom/expanded_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardMedium extends StatefulWidget {
  final ProjectData? project;
  final bool autoPlay;
  const ProjectCardMedium({super.key, this.autoPlay = false, this.project});

  @override
  State<ProjectCardMedium> createState() => _ProjectCardMediumState();
}

class _ProjectCardMediumState extends State<ProjectCardMedium> {
  bool readMore = false, autoPlay = false;

  CarouselController carouselController = CarouselController();
  int autoplayDuration = 4;

  int activeImage = 0, activeDescription = 0;

  @override
  void initState() {
    super.initState();
    autoPlay = widget.autoPlay;
  }

  @override
  Widget build(BuildContext context) {
    return widget.project == null
        ? gaph(h: 300)
        : Container(
            constraints: const BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
                    width: 400,
                    height: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: CarouselSlider(
                            items: widget.project!.imageUrl
                                .map(
                                  (e) => Image.network(
                                    e,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: autoPlay,
                              autoPlayInterval:
                                  Duration(seconds: autoplayDuration),
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeImage = index;
                                });
                              },
                            ),
                          ),
                        ),
                        widget.project!.imageUrl.length != 1
                            ? Positioned(
                                bottom: 50,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: activeImage,
                                  count: widget.project!.imageUrl.length,
                                  effect: const WormEffect(
                                      activeDotColor: kccSecondary,
                                      dotColor: kccSecondary,
                                      strokeWidth: 2,
                                      paintStyle: PaintingStyle.stroke,
                                      type: WormType.normal),
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
                                              if (mounted) {
                                                setState(() {
                                                  autoPlay = true;
                                                });
                                              }
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
                                      onPressed: activeImage ==
                                              widget.project!.imageUrl.length -
                                                  1
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
                    TextStyle chipTextStyle = kcfLBodyLarge();

                    double contentHorizontalPadding = 14;
                    double horizontalSpacing = 7,
                        verticalSpacing = 10,
                        verticalPadding = 4,
                        horizontalPadding = 10;
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
                      double chipWidth = _calculateChipWidth(
                            widget.project!.techUsed[i],
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
                    }
                    totalLineHeight += singleLineHeight;

                    double maxHeightForThreeLines = singleLineHeight * 3;

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
          gaph(h: 10),
          Text(
            widget.project!.title,
            style: kcfLDisplayMedium().copyWith(fontWeight: kcfsemibold),
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
              trimLines: 3,
              trimCollapsedText: "Show more",
              trimExpandedText: "Show less",
              widget.project!.description,
              style: kcfLBodyLarge(),
            ),
          ),
          gaph(h: 14),
          wrap,
          gaph(h: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.project!.projectLink != null
                  ? SizedBox(
                      height: 40,
                      child: MaterialButton(
                        padding: kcaInset0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        color: kccSecondary,
                        onPressed: () async {
                          final Uri url =
                              Uri.parse(widget.project!.projectLink!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "View Project",
                            style: kcfLBodyLarge(),
                          ),
                        ),
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.projectLink != null ? 15 : 0),
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
                        height: 40,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.playStoreLink != null ? 15 : 0),
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
                        height: 40,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.appStoreLink != null ? 15 : 0),
              widget.project!.projectDemo != null
                  ? SizedBox(
                      height: 40,
                      child: MaterialButton(
                        padding: kcaInset0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        color: kccSecondary,
                        onPressed: () async {
                          final Uri url =
                              Uri.parse(widget.project!.projectDemo!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Project Video",
                            style: kcfLBodyLarge(),
                          ),
                        ),
                      ),
                    )
                  : gapw(w: 0),
            ],
          ),
          gaph(h: 16),
        ],
      ),
    );
  }

  double _calculateSingleLineHeight(TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(text: 'A', style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.height;
  }

  double _calculateChipWidth(String text, TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }
}
