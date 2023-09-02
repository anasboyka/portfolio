import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/view/widgets/custom/expanded_text.dart';

class ContentExpanded extends StatefulWidget {
  const ContentExpanded({
    super.key,
    required this.data,
    this.style,
    this.maxMultiline = 4,
    this.onTapLink,
  });
  final String data;
  final TextStyle? style;
  final int maxMultiline;
  final Function(bool)? onTapLink;

  @override
  State<ContentExpanded> createState() => _ContentExpandedState();
}

class _ContentExpandedState extends State<ContentExpanded> {
  bool readMore = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: !readMore ? const NeverScrollableScrollPhysics() : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: ExpandedText(
          widget.data,
          trimLines: widget.maxMultiline,
          isExpanded: readMore,
          onTapLink: () {
            setState(() {
              readMore = !readMore;
            });
            if (widget.onTapLink != null) {
              widget.onTapLink!(readMore);
            }
          },
          linkColor: kccSecondary,
          style: widget.style ?? kcfSBodyMedium(),
        ),
      ),
    );
  }
}
