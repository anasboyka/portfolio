import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/common/constant/enum/enum.dart';

class AdaptiveLayout extends StatelessWidget {
  final double largeMinWidth;
  final double? mediumOrSmallMinWidth;
  // final double? smallBreakPoint;
  // final BreakpointRange largeBreakpoint;
  // final BreakpointRange? mediumBreakpoint;
  // final BreakpointRange? smallBreakpoint;
  final Widget Function(
          BuildContext context, BoxConstraints constraint, Layout screenSize)
      bodyLarge;
  final Widget Function(
          BuildContext context, BoxConstraints constraint, Layout screenSize)?
      bodyMedium;
  final Widget Function(
          BuildContext context, BoxConstraints constraint, Layout screenSize)?
      bodySmall;

  const AdaptiveLayout(
      {super.key,
      this.largeMinWidth = kcaLargeScreenMinWidth,
      this.mediumOrSmallMinWidth = kcaMediumScreenMinWidth,
      // this.smallBreakPoint,
      // this.largeBreakpoint = const BreakpointRange(minWidth: 1000),
      // this.mediumBreakpoint,
      // this.smallBreakpoint,
      required this.bodyLarge,
      this.bodyMedium,
      this.bodySmall});

  @override
  Widget build(BuildContext context) {
    return
        //  AdaptiveScaffold(destinations: destinations)

        LayoutBuilder(
      builder: (context, constraints) {
        if (bodyMedium == null && bodySmall == null) {
          Layout layout = getlayoutType(constraints.maxWidth);
          return bodyLarge(context, constraints, layout);
        } else if (bodyMedium == null && bodySmall != null) {
          if (constraints.maxWidth >= largeMinWidth) {
            Layout layout = getlayoutType(constraints.maxWidth);
            return bodyLarge(context, constraints, layout);
          } else {
            Layout layout = getlayoutType(constraints.maxWidth);
            return bodySmall!(context, constraints, layout);
          }
        } else if (bodyMedium != null && bodySmall == null) {
          if (constraints.maxWidth >= largeMinWidth) {
            Layout layout = getlayoutType(constraints.maxWidth);
            return bodyLarge(context, constraints, layout);
          } else {
            Layout layout = getlayoutType(constraints.maxWidth);
            return bodyMedium!(context, constraints, layout);
          }
        } else {
          if (constraints.maxWidth >= largeMinWidth) {
            Layout layout = getlayoutType(constraints.maxWidth);
            return bodyLarge(context, constraints, layout);
          } else if (constraints.maxWidth >= mediumOrSmallMinWidth! &&
              constraints.maxWidth < largeMinWidth) {
            Layout layout = getlayoutType(constraints.maxWidth);
            return bodyMedium!(context, constraints, layout);
          } else {
            Layout layout = getlayoutType(constraints.maxWidth);
            return bodySmall!(context, constraints, layout);
          }
        }
      },
    );
  }

  Layout getlayoutType(double width) {
    if (width >= largeMinWidth) {
      return Layout.large;
    } else if (width >= mediumOrSmallMinWidth! && width < largeMinWidth) {
      return Layout.medium;
    } else {
      return Layout.small;
    }

    // switch (width) {
    //   case width:

    //     break;
    //   default:
    // }
  }
}
