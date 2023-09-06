import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';
import 'package:portfolio/view/pages/homepage/project/layout/small/project_card_small.dart';
import 'package:portfolio/view/widgets/navigation/page_number_navigation/page_number_control.dart';

class ProjectPageContentSmall extends StatefulWidget {
  final ProjCategory projCategory;
  final BoxConstraints constraint;
  const ProjectPageContentSmall(
      {super.key, required this.projCategory, required this.constraint});

  @override
  State<ProjectPageContentSmall> createState() =>
      _ProjectPageContentSmallState();
}

class _ProjectPageContentSmallState extends State<ProjectPageContentSmall> {
  List<String> test = ['test', 'sadas'];
  int currentIndex = 0, previousIndex = 0;
  PageController pageController =
      PageController(viewportFraction: 0.85, initialPage: 0);
  CarouselController carouselController = CarouselController();

  double getAnimationValue(int currentIndex, int widgetIndex, int previousIndex,
      {bool begin = true}) {
    if (widgetIndex == currentIndex) {
      return begin ? 0.9 : 1;
    } else {
      return begin ? 1 : 0.9;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future:
                FirestoreDb().getProjectByCategories(widget.projCategory.text),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<ProjectData> projects = snapshot.data;

                return CarouselSlider.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index, realIndex) {
                    return ProjectCardSmall(
                      constraint: widget.constraint,
                      key: UniqueKey(),
                      project: projects[index],
                      autoPlay: currentIndex == index,
                    );
                  },
                  options: CarouselOptions(
                    height: widget.constraint.maxWidth > 480 ? 480 : 330,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  carouselController: carouselController,
                );
              } else {
                return const CircularProgressIndicator.adaptive();
              }
            }),
        gaphr(),
        FutureBuilder(
            future: FirestoreDb().getProjectPage(widget.projCategory),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                int itemCount = snapshot.data;
                int lastPage = itemCount;
                return PageNumberControl(
                  iconSize: 36,
                  pageButtonMinWidth: 36,
                  height: 36,
                  currentPage: currentIndex + 1,
                  lastPage: lastPage,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 24,
                    color: kccWhite,
                    fontWeight: kcfmedium,
                  ),
                  onNextPressed: () {
                    setState(() {
                      currentIndex++;
                      carouselController.animateToPage(currentIndex);
                    });
                  },
                  onPrevPressed: () {
                    setState(() {
                      currentIndex--;
                      carouselController.animateToPage(currentIndex);
                    });
                  },
                  onChanged: lastPage == 1
                      ? null
                      : (value) {
                          setState(() {
                            currentIndex = int.parse(value ?? '1') - 1;
                            carouselController.animateToPage(currentIndex);
                          });
                        },
                );
              } else {
                return const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(child: CircularProgressIndicator()));
              }
            }),
      ],
    );
  }
}
