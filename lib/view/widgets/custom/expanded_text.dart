import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/constant/res/const_color.dart';
import 'package:portfolio/common/constant/string/const_string.dart';

class ExpandedText extends StatelessWidget {
  const ExpandedText(this.data,
      {super.key,
      required this.isExpanded,
      this.style,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.textScaleFactor,
      this.semanticsLabel,
      this.trimExpandedText = 'show less',
      this.trimCollapsedText = 'read more',
      this.trimLines = 2,
      required this.onTapLink,
      this.delimiter = kcsEllipsis,
      this.delimiterStyle,
      this.linkStyle,
      this.linkColor = kccSecondary});
  final String data;
  final bool isExpanded;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final double? textScaleFactor;
  final String? semanticsLabel;
  final String trimExpandedText;
  final String trimCollapsedText;
  final int trimLines;
  final VoidCallback onTapLink;
  final String delimiter;
  final TextStyle? delimiterStyle;
  final TextStyle? linkStyle;
  final Color? linkColor;

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle? effectiveTextStyle = style;
    if (style?.inherit ?? false) {
      effectiveTextStyle = defaultTextStyle.style.merge(style);
    }
    final defaultDelimiterStyle = delimiterStyle ?? effectiveTextStyle;

    TextSpan link = TextSpan(
      text: !isExpanded ? trimCollapsedText : trimExpandedText,
      style: linkStyle ?? style?.copyWith(color: linkColor),
      recognizer: TapGestureRecognizer()..onTap = onTapLink,
    );

    TextSpan delimiterSpan = TextSpan(
      text: !isExpanded
          ? trimCollapsedText.isNotEmpty
              ? delimiter
              : ''
          : '',
      style: defaultDelimiterStyle?.copyWith(color: kccSecondary),
      recognizer: TapGestureRecognizer()..onTap = onTapLink,
    );

    Widget result = LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final text = TextSpan(
          children: [
            TextSpan(text: data, style: effectiveTextStyle),
          ],
        );

        TextPainter textPainter = TextPainter(
          text: link,
          textAlign: textAlign ?? TextAlign.start,
          textDirection: textDirection ?? Directionality.of(context),
          textScaleFactor:
              textScaleFactor ?? MediaQuery.textScaleFactorOf(context),
          maxLines: trimLines,
          // ellipsis: overflow == TextOverflow.ellipsis ? widget.delimiter : null,
          locale: locale ?? Localizations.maybeLocaleOf(context),
        );

        textPainter.layout(minWidth: 0, maxWidth: maxWidth);
        final linkSize = textPainter.size;

        // Layout and measure delimiter
        textPainter.text = delimiterSpan;
        textPainter.layout(minWidth: 0, maxWidth: maxWidth);
        final delimiterSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;

        // Get the endIndex of data
        bool linkLongerThanLine = false;
        int endIndex;

        if (linkSize.width < maxWidth) {
          final readMoreSize = linkSize.width + delimiterSize.width;
          final pos = textPainter.getPositionForOffset(Offset(
            textDirection == TextDirection.rtl
                ? readMoreSize
                : textSize.width - readMoreSize,
            textSize.height,
          ));
          endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;
        } else {
          var pos = textPainter.getPositionForOffset(
            textSize.bottomLeft(Offset.zero),
          );
          endIndex = pos.offset;
          linkLongerThanLine = true;
        }

        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            style: effectiveTextStyle,
            text: !isExpanded
                ? data.substring(0, endIndex) +
                    (linkLongerThanLine ? kcsLineSeparator : '')
                : data,
            children: <TextSpan>[delimiterSpan, link],
          );
        } else {
          textSpan = TextSpan(
            style: effectiveTextStyle,
            text: data,
          );
        }

        return Text.rich(
          TextSpan(
            children: [
              textSpan,
            ],
          ),
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: true,
          overflow: TextOverflow.clip,
          textScaleFactor: textScaleFactor,
        );
      },
    );
    if (semanticsLabel != null) {
      result = Semantics(
        textDirection: textDirection,
        label: semanticsLabel,
        child: ExcludeSemantics(
          child: result,
        ),
      );
    }
    return result;
  }
}
