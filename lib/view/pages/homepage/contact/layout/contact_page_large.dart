import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/resume_file.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPageLarge extends StatelessWidget {
  const ContactPageLarge({
    super.key,
    required this.layout,
    required this.pageConstraint,
  });
  final Layout layout;
  final BoxConstraints pageConstraint;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        gaph(h: 20.h),
        Text(
          'Contact',
          style: kcfStyleDisplayLarge()//textTheme.displayLarge?.copyWith(fontSize: 50.sp),
        ),
        Text(
          "Hire or Collaborate with me ",
          style: textTheme.bodyMedium?.copyWith(
              color: kccWhite, fontWeight: kcfregular, fontSize: 20.sp),
        ),
        gaph(h: 17.h),
        Container(
          width: double.maxFinite,
          color: kccOnPrimary,
          // padding: EdgeInsets.symmetric(vertical: 60, horizontal: 140.w),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 130.w),
                  child: Column(
                    children: [
                      gaph(h: 30.h),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 130.w,
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      Text(
                        'Contact Details',
                        style: GoogleFonts.inter(
                          fontWeight: kcfregular,
                          fontSize: 48.sp,
                          color: kccWhite,
                        ),
                      ),
                      gaph(h: 30.h),
                      SelectableText(
                        kcsFullName,
                        style: GoogleFonts.inter(
                          fontWeight: kcfregular,
                          fontSize: 30.sp,
                          color: kccWhite,
                        ),
                      ),
                      gaph(h: 20.h),
                      SelectableText(
                        kcsAdress,
                        style: GoogleFonts.inter(
                          fontWeight: kcfregular,
                          fontSize: 30.sp,
                          fontStyle: FontStyle.italic,
                          color: kccWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      gaph(h: 40.h),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 180.w, maxWidth: 220.w),
                        child: MaterialButton(
                          //minWidth: 250.w,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: kccWhite,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'View Resume',
                                  style: textTheme.bodyMedium?.copyWith(
                                      fontSize: 20.sp,
                                      color: kccWhite,
                                      fontWeight: kcfbold),
                                ),
                                const Icon(
                                  Icons.contact_page_outlined,
                                  color: kccWhite,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      gaph(h: 60.h),
                      if (layout == Layout.large)
                        ...socialLinks
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: e,
                              ),
                            )
                            .toList()
                      else
                        Padding(
                            padding: EdgeInsets.only(top: 80.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: socialLinks
                                    .map(
                                      (e) => e.copyWith(row: true),
                                    )
                                    .toList())),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Container(
                      width: constraint.maxWidth,
                      color: kccSecondary,
                      padding: EdgeInsets.symmetric(horizontal: 70.w),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gaph(h: 50.h),
                            Text(
                              'Love to hear from you, Lets get in touch',
                              style: GoogleFonts.inter(
                                fontSize: 32.sp,
                                fontWeight: kcfmedium,
                                color: kccWhite,
                              ),
                            ),
                            gaph(h: 30.h),
                            TextFormField(
                              style: GoogleFonts.inter(
                                color: kccBlack,
                                fontWeight: kcfregular,
                              ),
                              // controller: ,
                              decoration: InputDecoration(
                                border: defaultBorder(),
                                enabledBorder: defaultBorder(),
                                focusedBorder: defaultBorder(),
                                errorBorder: defaultBorder().copyWith(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                hintText: 'Full Name*',
                                hintStyle: GoogleFonts.inter(
                                  color: kccgrey4,
                                  fontWeight: kcfregular,
                                ),
                                fillColor: kccWhite3,
                                filled: true,
                              ),
                            ),
                            gaph(h: 40),
                            TextFormField(
                              style: GoogleFonts.inter(
                                color: kccBlack,
                                fontWeight: kcfregular,
                              ),
                              // controller: ,
                              decoration: InputDecoration(
                                border: defaultBorder(),
                                enabledBorder: defaultBorder(),
                                focusedBorder: defaultBorder(),
                                errorBorder: defaultBorder().copyWith(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                hintText: 'Email Address*',
                                hintStyle: GoogleFonts.inter(
                                  color: kccgrey4,
                                  fontWeight: kcfregular,
                                ),
                                fillColor: kccWhite3,
                                filled: true,
                              ),
                            ),
                            gaph(h: 40),
                            TextFormField(
                              style: GoogleFonts.inter(
                                color: kccBlack,
                                fontWeight: kcfregular,
                              ),
                              // controller: ,
                              decoration: InputDecoration(
                                border: defaultBorder(),
                                enabledBorder: defaultBorder(),
                                focusedBorder: defaultBorder(),
                                errorBorder: defaultBorder().copyWith(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                hintText: 'Phone',
                                hintStyle: GoogleFonts.inter(
                                  color: kccgrey4,
                                  fontWeight: kcfregular,
                                ),
                                fillColor: kccWhite3,
                                filled: true,
                              ),
                            ),
                            gaph(h: 40),
                            TextFormField(
                              style: GoogleFonts.inter(
                                color: kccBlack,
                                fontWeight: kcfregular,
                              ),
                              // controller: ,
                              decoration: InputDecoration(
                                border: defaultBorder(),
                                enabledBorder: defaultBorder(),
                                focusedBorder: defaultBorder(),
                                errorBorder: defaultBorder().copyWith(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                hintText: 'Company',
                                hintStyle: GoogleFonts.inter(
                                  color: kccgrey4,
                                  fontWeight: kcfregular,
                                ),
                                fillColor: kccWhite3,
                                filled: true,
                              ),
                            ),
                            gaph(h: 40),
                            TextFormField(
                              maxLines: 4,
                              style: GoogleFonts.inter(
                                color: kccBlack,
                                fontWeight: kcfregular,
                              ),
                              // controller: ,
                              decoration: InputDecoration(
                                border: defaultBorder(),
                                enabledBorder: defaultBorder(),
                                focusedBorder: defaultBorder(),
                                errorBorder: defaultBorder().copyWith(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                hintText: 'Message',
                                hintStyle: GoogleFonts.inter(
                                  color: kccgrey4,
                                  fontWeight: kcfregular,
                                ),
                                fillColor: kccWhite3,
                                filled: true,
                              ),
                            ),
                            gaph(h: 30),
                            Row(
                              children: [
                                MaterialButton(
                                  onPressed: () {},
                                  minWidth: 150.w,
                                  height: 70.h,
                                  padding: kcaInset0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: const BorderSide(
                                        color: kccWhite3, width: 3),
                                  ),
                                  color: kccOnPrimary,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 10.h),
                                    child: Text(
                                      'Submit',
                                      style: textTheme.headlineLarge?.copyWith(
                                          fontWeight: kcfbold, fontSize: 28.sp),
                                    ),
                                  ),
                                ),
                                // gapwr(),
                                // MaterialButton(
                                //   minWidth: 150.w,
                                //   height: 70.h,
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(6),
                                //     side: const BorderSide(
                                //         color: kccWhite3, width: 3),
                                //   ),
                                //   padding: kcaInset0,
                                //   color: kccOnPrimary,
                                //   onPressed: () async {
                                //     ResumeFile resumeFile =
                                //         await FirestoreDb()
                                //             .getLatestResume();
                                //     print(resumeFile.url);
                                //   },
                                //   child: Padding(
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 16.w, vertical: 10.h),
                                //     child: Row(
                                //       children: [
                                //         Text(
                                //           'View Resume',
                                //           style: textTheme.headlineLarge
                                //               ?.copyWith(
                                //                   fontWeight: kcfbold,
                                //                   fontSize: 28.sp),
                                //         ),
                                //         gapwr(w: 10),
                                //         Icon(
                                //           Icons.contact_page_outlined,
                                //           color: kccWhite,
                                //           size: 36.w,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            gaph(h: 30),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  OutlineInputBorder defaultBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: kccgrey4),
    );
  }
}
