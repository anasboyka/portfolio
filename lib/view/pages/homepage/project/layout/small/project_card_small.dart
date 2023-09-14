import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/view/widgets/custom/expanded_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardSmall extends StatefulWidget {
  const ProjectCardSmall(
      {super.key,
      this.project,
      this.autoPlay = false,
      required this.constraint});
  final ProjectData? project;
  final bool autoPlay;
  final BoxConstraints constraint;

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("project all constraint ${widget.constraint.maxWidth}");
    return Container(
      constraints: BoxConstraints(
          maxHeight: widget.constraint.maxWidth > 480 ? 480 : 330),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
              height: widget.constraint.maxWidth > 480 ? 270 : 178,
              width: double.maxFinite,
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
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: autoPlay,
                        autoPlayInterval: Duration(seconds: autoplayDuration),
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
                          bottom: 10,
                          child: AnimatedSmoothIndicator(
                            onDotClicked: (index) {
                              carouselController.animateToPage(index);
                            },
                            activeIndex: activeImage,
                            count: widget.project!.imageUrl.length,
                            effect: const WormEffect(
                              dotWidth: 12,
                              dotHeight: 12,
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
                                constraints: const BoxConstraints(
                                  maxHeight: 48,
                                  maxWidth: 48,
                                ),
                                iconSize: 48,
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
                                  size: 48,
                                  color: kccgrey1.withOpacity(0.6),
                                ),
                              ),
                              IconButton(
                                padding: kcaInset0,
                                constraints: const BoxConstraints(
                                  maxHeight: 48,
                                  maxWidth: 48,
                                ),
                                iconSize: 48,
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

              double contentHorizontalPadding = 6;
              double horizontalSpacing = 6,
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

              int maxLines = widget.constraint.maxWidth > 480 ? 5 : 4;
              final descSpan = TextSpan(
                text: widget.project!.description,
                style: kcfSBodySmall(),
              );
              final tp = TextPainter(
                text: descSpan,
                textDirection: TextDirection.ltr,
              );
              tp.layout(maxWidth: contentConstraint.maxWidth);

              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: contentHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gaph(h: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.project!.title,
                            style: widget.constraint.maxWidth > 480
                                ? kcfLTitleMedium(r: false)
                                    .copyWith(fontWeight: kcfsemibold)
                                : kcfSBodyMedium().copyWith(
                                    fontWeight: kcfbold,
                                  ),
                          ),
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
                                      style: widget.constraint.maxWidth > 480
                                          ? kcfSBodyLarge().copyWith(
                                              color: kccSecondary,
                                              fontWeight: kcfbold)
                                          : kcfSBodySmall().copyWith(
                                              color: kccSecondary,
                                              fontWeight: kcfbold),
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      size: 24,
                                      color: kccSecondary,
                                    ),
                                  ],
                                ),
                              )
                            : gaph(h: 0)
                      ],
                    ),
                    gaph(h: 4),
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
                                  constraints: const BoxConstraints(
                                      maxWidth: 32, maxHeight: 32),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  splashRadius: 12,
                                  iconSize: 24,
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
                                  icon: const Icon(
                                    CupertinoIcons.chevron_left_circle,
                                    size: 24,
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
                    gaph(h: 2),
                    Container(
                      height: 1,
                      color: kccgrey3,
                    ),
                    gaph(h: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.project!.projectLink != null
                            ? SizedBox(
                                height: 24,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
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
                                  ),
                                ),
                              )
                            : gapw(w: 0),
                        gapw(w: widget.project!.projectLink != null ? 18 : 0),
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
                                  height: 24,
                                ),
                              )
                            : gapw(w: 0),
                        gapw(w: widget.project!.playStoreLink != null ? 18 : 0),
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
                                  height: 24,
                                ),
                              )
                            : gapw(w: 0),
                        gapw(w: widget.project!.appStoreLink != null ? 18 : 0),
                        widget.project!.projectDemo != null
                            ? SizedBox(
                                height: 24,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
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
                                  ),
                                ),
                              )
                            : gapw(w: 0),
                      ],
                    ),
                    gaph(h: 10)
                  ],
                ),
              );
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
      trimLines: maxLines,
      trimCollapsedText: "Show more",
      trimExpandedText: "Show less",
      widget.project!.description,
      style: widget.constraint.maxWidth > 480
          ? kcfSBodyMedium().copyWith(fontWeight: kcfmedium)
          : kcfSBodySmall(),
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
          gaph(h: 7),
          Text(
            widget.project!.title,
            style: widget.constraint.maxWidth > 480
                ? kcfLTitleMedium(r: false).copyWith(fontWeight: kcfsemibold)
                : kcfSBodyLarge().copyWith(
                    fontWeight: kcfbold,
                  ),
          ),
          gaph(h: 4),
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
              style: kcfSBodySmall(),
            ),
          ),
          gaph(h: 7),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.project!.projectLink != null
                  ? SizedBox(
                      height: 24,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
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
                        ),
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.projectLink != null ? 18 : 0),
              widget.project!.playStoreLink != null
                  ? InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icon/4x/ic_google_play_4x.png",
                        height: 24,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.playStoreLink != null ? 18 : 0),
              widget.project!.playStoreLink != null
                  ? InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icon/4x/ic_app_store_4x.png",
                        height: 24,
                      ),
                    )
                  : gapw(w: 0),
              gapw(w: widget.project!.appStoreLink != null ? 18 : 0),
              widget.project!.projectDemo != null
                  ? SizedBox(
                      height: 24,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
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
