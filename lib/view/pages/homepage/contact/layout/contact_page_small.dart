import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/resume_file.dart';
import 'package:portfolio/data/remote/services/firebase/firestoredb.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class ContactPageSmall extends StatefulWidget {
  const ContactPageSmall({super.key});

  @override
  State<ContactPageSmall> createState() => _ContactPageSmallState();
}

class _ContactPageSmallState extends State<ContactPageSmall> {
  TextEditingController fullNameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController companyCon = TextEditingController();
  TextEditingController messageCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String serviceId = 'service_9vrj39n';
  String templateId = 'template_qa8mfv6';
  String userId = 'FqDnMjGcErMCNEbZB';
  String privateKey = "xcsfxQsVDlAJgc74O-zFG";
  String messageStatus = "";
  bool displayMessage = false;

  Future sendEmail() async {
    // service_9vrj39n
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {"content-Type": "application/json"},
      body: jsonEncode(
        {
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "accessToken": privateKey,
          "template_params": {
            "subject": "Incoming message from portfolio",
            "name": fullNameCon.text,
            "contact_email": emailCon.text,
            "contact_phone_num": phoneCon.text,
            "contact_company": companyCon.text,
            "message": messageCon.text
          }
        },
      ),
    );
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          color: kccOnPrimary,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                gaph(h: 20.h),
                Text('Contact',
                    style: kcfLHeadlineSmall().copyWith(
                      fontWeight: kcfbold,
                    )),
                Text("Hire or Collaborate with me ", style: kcfSBodyMedium()),
                gaph(h: 17.h),
                Container(
                  color: kccWhite,
                  height: 2,
                ),
                gaphr(),
                Text('Send Me a Message', style: kcfLHeadlineSmall()),
                gaph(h: 8.h),
                SelectableText(
                  kcsFullName,
                  style: kcfSBodyMedium(),
                ),
                gaph(h: 10.h),
                SelectableText(
                  kcsAdress,
                  style: kcfSBodyMedium().copyWith(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                gaph(h: 10.h),
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
                gaph(h: 20.h),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: socialLinks
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.w),
                            child: e.copyWith(
                              row: false,
                              iconWidth: 24.w,
                              style: kcfSBodySmall(),
                              gap: 10.w,
                            ),
                          ),
                        )
                        .toList()),
                gaphr(),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          color: kccSecondary,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gaphr(),
                Text(
                  'Love to hear from you, Lets get in touch',
                  style: kcfLBodyMedium().copyWith(fontWeight: kcfmedium),
                ),
                gaphr(),
                TextFormField(
                  controller: fullNameCon,
                  style: GoogleFonts.inter(
                    color: kccBlack,
                    fontWeight: kcfregular,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill in your name to proceed";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    border: defaultBorder(),
                    enabledBorder: defaultBorder(),
                    focusedBorder: defaultBorder(),
                    errorBorder: defaultBorder().copyWith(
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintText: 'Name*',
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
                  controller: emailCon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill in your Email to proceed";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    border: defaultBorder(),
                    enabledBorder: defaultBorder(),
                    focusedBorder: defaultBorder(),
                    errorBorder: defaultBorder().copyWith(
                      borderSide: const BorderSide(color: Colors.red),
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
                  controller: phoneCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    border: defaultBorder(),
                    enabledBorder: defaultBorder(),
                    focusedBorder: defaultBorder(),
                    errorBorder: defaultBorder().copyWith(
                      borderSide: const BorderSide(color: Colors.red),
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
                  controller: companyCon,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    border: defaultBorder(),
                    enabledBorder: defaultBorder(),
                    focusedBorder: defaultBorder(),
                    errorBorder: defaultBorder().copyWith(
                      borderSide: const BorderSide(color: Colors.red),
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
                  controller: messageCon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill in your Message to proceed";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8),
                    border: defaultBorder(),
                    enabledBorder: defaultBorder(),
                    focusedBorder: defaultBorder(),
                    errorBorder: defaultBorder().copyWith(
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintText: 'Message*',
                    hintStyle: GoogleFonts.inter(
                      color: kccgrey4,
                      fontWeight: kcfregular,
                    ),
                    fillColor: kccWhite3,
                    filled: true,
                  ),
                ),
                gaphr(),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            if (mounted) {
                              setState(() {
                                displayMessage = true;
                                messageStatus = "Sending Message...";
                              });
                            }
                            int result = await sendEmail();
                            if (result != 200) {
                              print(result);
                            } else {
                              if (mounted) {
                                setState(() {
                                  messageStatus = "Message Successfully send";
                                });
                              }
                              fullNameCon.clear();
                              emailCon.clear();
                              phoneCon.clear();
                              companyCon.clear();
                              messageCon.clear();
                            }
                          } on Exception catch (e) {
                            messageStatus = "Error sending message $e";
                          }
                          await Future.delayed(
                            const Duration(seconds: 5),
                          );
                          if (mounted) {
                            setState(() {
                              messageStatus = "";
                              displayMessage = false;
                            });
                          }
                        }
                      },
                      minWidth: 120.w,
                      padding: kcaInset0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: const BorderSide(color: kccWhite3, width: 3),
                      ),
                      color: kccOnPrimary,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        child: Text('Submit',
                            style:
                                kcfSBodyLarge().copyWith(fontWeight: kcfbold)),
                      ),
                    ),
                    gapwr(),
                    displayMessage
                        ? Text(
                            messageStatus,
                            style: kcfSBodyLarge(),
                          )
                        : gapw(w: 0),
                  ],
                ),
                gaph(h: 30),
              ],
            ),
          ),
        )
      ],
    );
  }

  OutlineInputBorder defaultBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: kccgrey4),
    );
  }
}
