import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/common.dart';

class SocialLink extends StatefulWidget {
  const SocialLink({
    super.key,
    required this.ontapLink,
    required this.iconAsset,
    required this.text,
    this.row = false,
    this.iconWidth = 48,
    this.style,
    this.gap = 30,
  });

  final VoidCallback ontapLink;
  final String iconAsset;
  final String text;
  final bool row;
  final double iconWidth;
  final TextStyle? style;
  final double gap;

  @override
  State<SocialLink> createState() => _SocialLinkState();

  SocialLink copyWith({
    VoidCallback? ontapLink,
    String? iconAsset,
    String? text,
    bool? row,
    double? iconWidth,
    TextStyle? style,
    double? gap,
  }) {
    return SocialLink(
      ontapLink: ontapLink ?? this.ontapLink,
      iconAsset: iconAsset ?? this.iconAsset,
      text: text ?? this.text,
      row: row ?? this.row,
      iconWidth: iconWidth ?? this.iconWidth,
      style: style ?? this.style,
      gap: gap ?? this.gap,
    );
  }
}

class _SocialLinkState extends State<SocialLink> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    // print("layout should be rwo ${widget.row}");
    return widget.row
        ? InkWell(
            onHover: (value) {
              setState(() {
                hover = value;
              });
            },
            onTap: widget.ontapLink,
            child: Image.asset(
              widget.iconAsset,
              width: widget.iconWidth,
            ).animate(target: hover ? 1 : 0).scaleXY(
                  end: 1.2,
                  alignment: Alignment.center,
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  curve: Curves.easeInCubic,
                ),
          )
        : Row(
            children: [
              InkWell(
                onHover: (value) {
                  setState(() {
                    hover = value;
                  });
                },
                onTap: widget.ontapLink,
                child: Image.asset(
                  widget.iconAsset,
                  width: widget.iconWidth,
                ).animate(target: hover ? 1 : 0).scaleXY(
                      end: 1.2,
                      alignment: Alignment.center,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      curve: Curves.easeInCubic,
                    ),
              ),
              // IconButton(
              //   onPressed: ontapLink,
              //   icon: Icon(
              //     icon,
              //     size: 48,
              //   ),
              // ),
              gapw(w: widget.gap),
              SelectableText(
                widget.text,
                style: widget.style ??
                    GoogleFonts.inter(
                      fontWeight: kcfregular,
                      fontSize: 30.sp,
                      color: kccWhite,
                    ),
              ),
            ],
          );
  }
}
