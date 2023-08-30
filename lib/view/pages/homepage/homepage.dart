import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';
import 'package:portfolio/data/remote/services/firebase/storagedb.dart';
import 'package:portfolio/view/pages/homepage/about/about_page.dart';
import 'package:portfolio/view/pages/homepage/contact/contact_page.dart';
import 'package:portfolio/view/pages/homepage/expertise/expertise_page.dart';
import 'package:portfolio/view/pages/homepage/project/project_page.dart';
import 'package:portfolio/view/pages/homepage/qualification/qualification_page.dart';
import 'package:portfolio/view/widgets/layout/adaptive_layout.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _isPlay = false;
  bool _showAppBar = true;
  // bool _isScrolling = true;
  late AnimationController _animationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey _aboutmeKey = GlobalKey();
  final GlobalKey _expertiseKey = GlobalKey();
  final GlobalKey _qualificationKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  double currentYPosition = 0;
  List<String> urlList = [];
  List<Uint8List> fileBytes = [];
  final titleCon = TextEditingController();
  final desccon = TextEditingController();
  final tagcon = TextEditingController();
  final appstorelinkcon = TextEditingController();
  final playstorelinkcon = TextEditingController();
  final projectdemocon = TextEditingController();
  final githublinkcon = TextEditingController();
  final ratingcon = TextEditingController();

  final idcon = TextEditingController();
  List<String> tags = [];
  List<String> fileName = [];
  double progress = 0;
  List<String> categories = [
        "Featured",
        "Recent",
        "All",
        "Mobile Apps",
        "Electronics"
      ],
      selectedCategories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _scrollController.addListener(() {
      double yPos = _scrollController.offset;
      currentYPosition = yPos;

      // if (_scrollController.position.userScrollDirection ==
      //     ScrollDirection.reverse) {
      //   setState(() {
      //     _showAppBar = false;
      //   });
      // } else if (_scrollController.position.userScrollDirection ==
      //     ScrollDirection.forward) {
      //   setState(() {
      //     _showAppBar = true;
      //   });
      // }
      print("current Y value =  $yPos");
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //scrolltowidget(_projectKey);
      // _scrollToItem(4000);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void scrolltowidget(GlobalKey pageKey) {
    // print('scroll');
    RenderBox renderBox =
        pageKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset(0, currentYPosition));
    double yPosition = offset.dy;

    // print(yPosition);
    // Scrollable.ensureVisible(pageKey.currentContext!);

    _scrollToItem(yPosition);
    setState(() {
      currentYPosition = yPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return AdaptiveLayout(bodyLarge: (context, screenConstraint, layout) {
      // print('layout $layout');
      // print('max width ${screenConstraint.maxWidth}');

      return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: _showAppBar
            ? appbarNavigation(layout != Layout.large, context)
            : null,
        endDrawer: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: drawer(layout != Layout.small ? 450.w : null),
        ),
        onEndDrawerChanged: (isOpened) {
          setState(() {
            if (isOpened) {
              _animationController.forward();
              _isPlay = true;
            } else {
              _animationController.reverse();
              _isPlay = false;
            }
          });
        },
        body:
            //  CustomScrollView(
            //   controller: _scrollController,
            //   slivers: [
            //     sliverAppbarNavigation(layout != Layout.large, context),
            //     SliverList(
            //       delegate: SliverChildListDelegate(
            //         [
            //           About(
            //             key: _aboutmeKey,
            //             appBarHeight:
            //                 appbarNavigation(false, context).preferredSize.height,
            //           ),
            //           Expertise(
            //             key: _expertiseKey,
            //           ),
            //           Qualification(
            //             key: _qualificationKey,
            //           ),
            //           Project(key: _projectKey),
            //           Contact(
            //             key: _contactKey,
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // )
            NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            // print(notification is ScrollStartNotification);
            // if (notification is ScrollStartNotification) {
            //   _isScrolling = true;
            // } else if (notification is ScrollEndNotification) {
            //   _isScrolling = false;
            // }
            _scrollController.position.isScrollingNotifier.value = true;

            return false;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: kcaInset0,
            child: Column(
              children: [
                AboutPage(
                  key: _aboutmeKey,
                  appBarHeight:
                      appbarNavigation(false, context).preferredSize.height,
                ),
                ExpertisePage(
                  key: _expertiseKey,
                ),
                QualificationPage(
                  key: _qualificationKey,
                ),
                ProjectPage(key: _projectKey),
                ContactPage(
                  key: _contactKey,
                ),
                // database(),
                // database2(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Column database2() {
    return Column(
      children: [
        tags.isEmpty
            ? Text(
                'empty tags ${tags.length}',
              )
            : Column(
                children: tags
                    .map((e) => Text(
                          e,
                          style: const TextStyle(color: kccWhite),
                        ))
                    .toList(),
              ),
        SizedBox(
          width: 600,
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: kccSecondary,
              hintText: 'appstore link',
            ),
            controller: appstorelinkcon,
          ),
        ),
        SizedBox(
          width: 600,
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: kccSecondary,
              hintText: 'playstore link',
            ),
            controller: playstorelinkcon,
          ),
        ),
        SizedBox(
          width: 600,
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: kccSecondary,
              hintText: 'project demo link',
            ),
            controller: projectdemocon,
          ),
        ),
        SizedBox(
          width: 600,
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: kccSecondary,
              hintText: 'project github link',
            ),
            controller: githublinkcon,
          ),
        ),
        SizedBox(
          width: 600,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              fillColor: kccSecondary,
              hintText: 'rating',
            ),
            controller: ratingcon,
          ),
        ),
        urlList.isNotEmpty
            ? Row(
                children: urlList
                    .map(
                      (e) => Image.network(
                        e,
                        width: 200,
                      ),
                    )
                    .toList(),
              )
            : Image.asset(
                'assets/images/img_cod.png',
                width: 400,
              ),
        fileBytes.isNotEmpty
            ? Column(
                children: fileBytes
                    .map(
                      (e) => Image.memory(
                        e,
                        width: 100,
                      ),
                    )
                    .toList(),
              )
            : const Text('no image'),
        CircularProgressIndicator(
            value: progress, backgroundColor: kccWhite, color: kccSecondary),
        MaterialButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              setState(() {
                fileName.add(result.files.first.name);
                fileBytes.add(result.files.first.bytes!);
              });
            }
          },
          child: const Text('Pick'),
        ),
        MaterialButton(
          onPressed: () async {
            try {
              if (titleCon.text.isNotEmpty &&
                  desccon.text.isNotEmpty &&
                  tags.isNotEmpty &&
                  selectedCategories.isNotEmpty &&
                  fileBytes.isNotEmpty &&
                  fileName.isNotEmpty) {
                DocumentReference ref = await FirestoreDb().addProjects(
                  ProjectData(
                    title: titleCon.text,
                    description: desccon.text,
                    techUsed: tags,
                    categories: selectedCategories
                        .map((e) => ProjCategoryEx.fromString(e))
                        .toList(),
                    appStoreLink: appstorelinkcon.text.isEmpty
                        ? null
                        : appstorelinkcon.text,
                    playStoreLink: playstorelinkcon.text.isEmpty
                        ? null
                        : playstorelinkcon.text,
                    projectDemo: projectdemocon.text.isEmpty
                        ? null
                        : projectdemocon.text,
                    projectLink:
                        githublinkcon.text.isEmpty ? null : githublinkcon.text,
                    rating: double.parse(ratingcon.text),
                  ),
                );
                print('operation run');
                for (var i = 0; i < fileBytes.length; i++) {
                  final uploadRef = await Storagedb().uploadImageInData(
                      fileBytes[i],
                      fileName[i],
                      'Project/images/${ref.id}',
                      onProgress);
                  final url = await uploadRef.getDownloadURL();
                  urlList.add(url);
                }
                await FirestoreDb().updateProjectsImage(
                  ref.id,
                  urlList,
                );
              } else {
                print('failed');
              }
            } catch (e) {
              print('catch error');
              print(e);
            }
            setState(() {});
          },
          child: const Text('save & upload'),
        ),
        SizedBox(
          width: 600,
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: kccSecondary,
              hintText: 'Document ID',
            ),
            controller: idcon,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  fileBytes = [];
                  titleCon.clear();
                  desccon.clear();
                  tagcon.clear();
                  tags = [];
                  selectedCategories = [];
                  progress = 0;
                });
              },
              child: const Text('clear'),
            ),
            MaterialButton(
              onPressed: () async {
                if (fileBytes.isNotEmpty &&
                    fileName.isNotEmpty &&
                    idcon.text.isNotEmpty) {
                  for (var i = 0; i < fileBytes.length; i++) {
                    final uploadRef = await Storagedb().uploadImageInData(
                      fileBytes[i],
                      fileName[i],
                      'Project/images/${idcon.text}',
                      onProgress,
                    );
                    final url = await uploadRef.getDownloadURL();
                    urlList.add(url);
                  }
                  await FirestoreDb().updateProjectsImage(
                    idcon.text,
                    urlList,
                  );
                  setState(() {});
                }
              },
              child: const Text('edit pic'),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox database() {
    return SizedBox(
      width: 600,
      child: Column(
        children: [
          TextField(
            controller: titleCon,
            decoration: const InputDecoration(
              fillColor: kccSecondary,
              filled: true,
              hintText: 'title',
            ),
          ),
          gaph(),
          TextField(
            controller: desccon,
            decoration: const InputDecoration(
              fillColor: kccSecondary,
              filled: true,
              hintText: 'description',
            ),
            maxLines: null,
            minLines: 5,
          ),
          gaph(),
          SizedBox(
            width: 500,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                hint: const Text(
                  'category',
                  style: TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                isExpanded: true,
                alignment: Alignment.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: kccWhite,
                  fontWeight: kcfmedium,
                ),
                buttonStyleData: ButtonStyleData(
                  padding: kcaInset0,
                  decoration: BoxDecoration(
                    //color: isHover ? kccblack4 : null,
                    border: Border.all(color: kccWhite),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(kccblack4),
                ),
                menuItemStyleData: const MenuItemStyleData(
                    //padding: EdgeInsets.symmetric(horizontal: 50.w),
                    ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  isOverButton: false,
                  // maxHeight: 250,
                ),
                value:
                    selectedCategories.isEmpty ? null : selectedCategories.last,
                items: categories
                    .map((item) => DropdownMenuItem(
                        value: item,
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final isSelected =
                                selectedCategories.contains(item);
                            return InkWell(
                              onTap: () {
                                isSelected
                                    ? selectedCategories.remove(item)
                                    : selectedCategories.add(item);
                                //This rebuilds the StatefulWidget to update the button's text
                                setState(() {});
                                //This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                                print(selectedCategories.length);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    if (isSelected)
                                      const Icon(Icons.check_box_outlined)
                                    else
                                      const Icon(Icons.check_box_outline_blank),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {});
                },
                selectedItemBuilder: (context) {
                  return categories.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          selectedCategories.join(', '),
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      );
                    },
                  ).toList();
                },
              ),
            ),
          ),
          gaph(),
          TextField(
            controller: tagcon,
            decoration: InputDecoration(
                fillColor: kccSecondary,
                filled: true,
                hintText: 'tags',
                suffix: IconButton(
                    onPressed: () {
                      tagcon.clear();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: kccWhite,
                    ))),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  tags.add(tagcon.text);
                  print(tags.length);
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }

  AppBar appbarNavigation(bool showDrawer, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 80.w, top: 10.h),
        child: Image.asset(
          'assets/images/logo_no_bg.png',
          height: 80.h,
        ),
      ),
      backgroundColor: kccTransparent,
      toolbarHeight: 80.h,
      actions: showDrawer
          ? [
              IconButton(
                alignment: Alignment.center,
                iconSize: 48.w,
                splashRadius: 60,
                padding: EdgeInsets.all(5.w),
                onPressed: () {
                  //Scaffold.of(context).openEndDrawer();
                  if (!_isPlay) {
                    _animationController.forward();
                    _isPlay = true;
                  } else {
                    _animationController.reverse();
                    _isPlay = false;
                  }
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                icon: AnimatedIcon(
                  progress: _animationController,
                  icon: AnimatedIcons.menu_close,
                  size: 48.w,
                ),
              ),
              gapwr(w: 20)
            ]
          : listNavigationButton(textTheme.headlineSmall
              ?.copyWith(fontWeight: kcfregular, fontSize: 24.sp)),
    );
  }

  SliverAppBar sliverAppbarNavigation(bool showDrawer, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      floating: true,
      snap: true,
      title: Padding(
        padding: EdgeInsets.only(left: 80.w, top: 10.h),
        child: Image.asset(
          'assets/images/logo_no_bg.png',
          height: 80.h,
        ),
      ),
      // backgroundColor: kccWhite,
      // shadowColor: kccTransparent,
      elevation: 0,
      // expandedHeight: 80.h,
      forceMaterialTransparency: true,

      toolbarHeight: 80.h,
      actions: showDrawer
          ? [
              IconButton(
                alignment: Alignment.center,
                iconSize: 48.w,
                splashRadius: 60,
                padding: EdgeInsets.all(5.w),
                onPressed: () {
                  //Scaffold.of(context).openEndDrawer();
                  if (!_isPlay) {
                    _animationController.forward();
                    _isPlay = true;
                  } else {
                    _animationController.reverse();
                    _isPlay = false;
                  }
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                icon: AnimatedIcon(
                  progress: _animationController,
                  icon: AnimatedIcons.menu_close,
                  size: 48.w,
                ),
              ),
              gapwr(w: 20)
            ]
          : listNavigationButton(textTheme.bodyMedium
              ?.copyWith(fontWeight: kcfregular, fontSize: 18.sp)),
    );
  }

  Drawer drawer(double? width) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      backgroundColor: kccOnPrimary,
      elevation: 3,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...listNavigationButton(
            textTheme.displayMedium
                ?.copyWith(fontWeight: kcfregular, fontSize: 30.sp),
          )
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: e,
                ),
              )
              .toList(),
        ]),
      ),
    );
  }

  // List<Widget> actionNavigationList() {
  //   final textTheme = Theme.of(context).textTheme;
  //   return listNavigationButton(
  //     textTheme.bodyMedium?.copyWith(fontWeight: kcfregular, fontSize: 18.sp),
  //   );
  // }

  List<Widget> listNavigationButton(TextStyle? style,
      {bool isExpanded = false}) {
    return [
      SizedBox(
        width: isExpanded ? double.maxFinite : null,
        child: TextButton(
          onPressed: () {
            if (_scaffoldKey.currentState != null) {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState?.closeEndDrawer();
              }
            }
            scrolltowidget(_aboutmeKey);
          },
          child: Text(
            'ABOUT ME',
            style: style,
          ),
        ),
      ),
      SizedBox(
        width: isExpanded ? double.maxFinite : null,
        child: TextButton(
          onPressed: () {
            if (_scaffoldKey.currentState != null) {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState?.closeEndDrawer();
              }
            }
            scrolltowidget(_expertiseKey);
          },
          child: Text(
            'EXPERTISE',
            style: style,
          ),
        ),
      ),
      SizedBox(
        width: isExpanded ? double.maxFinite : null,
        child: TextButton(
          onPressed: () {
            if (_scaffoldKey.currentState != null) {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState?.closeEndDrawer();
              }
            }
            scrolltowidget(_qualificationKey);
          },
          child: Text(
            'QUALIFICATION',
            style: style,
          ),
        ),
      ),
      SizedBox(
        width: isExpanded ? double.maxFinite : null,
        child: TextButton(
          onPressed: () {
            if (_scaffoldKey.currentState != null) {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState?.closeEndDrawer();
              }
            }
            scrolltowidget(_projectKey);
          },
          child: Text(
            'PROJECT',
            style: style,
          ),
        ),
      ),
      SizedBox(
        width: isExpanded ? double.maxFinite : null,
        child: TextButton(
          onPressed: () {
            if (_scaffoldKey.currentState != null) {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState?.closeEndDrawer();
              }
            }
            scrolltowidget(_contactKey);
          },
          child: Text(
            'CONTACT',
            style: style,
          ),
        ),
      ),
    ];
  }

  void _scrollToItem(double height) {
    _scrollController.animateTo(
      height, // Adjust the height according to your item height.
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void onProgress(double val) {
    setState(() {
      progress = val;
    });
  }
}
