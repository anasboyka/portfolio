import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/common/common.dart';

class PageNumberControl extends StatefulWidget {
  final double height;
  final double pageButtonMinWidth;
  final int currentPage;
  final int lastPage;
  final TextStyle? labelStyle;
  final VoidCallback? onPrevPressed;
  final VoidCallback? onNextPressed;
  final void Function(String? value)? onChanged;
  final double iconSize;
  const PageNumberControl({
    super.key,
    required this.pageButtonMinWidth,
    required this.height,
    required this.currentPage,
    required this.lastPage,
    this.labelStyle,
    this.onPrevPressed,
    this.onNextPressed,
    this.onChanged,
    this.iconSize = 48,
  });

  @override
  State<PageNumberControl> createState() => _PageNumberControlState();
}

class _PageNumberControlState extends State<PageNumberControl> {
  int currentPage = 1;

  Color containerColor = kccBlack4;
  bool hover = false;
  final key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = widget.currentPage;
  }

  @override
  void didUpdateWidget(covariant PageNumberControl oldWidget) {
    // TODO: implement didUpdateWidget
    if (widget.currentPage != oldWidget.currentPage) {
      setState(() {
        currentPage = widget.currentPage;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Material(
                color: kccTransparent,
                child: IconButton(
                  color: kccWhite,
                  constraints: BoxConstraints(
                    maxHeight: widget.iconSize,
                    maxWidth: widget.iconSize,
                  ),
                  iconSize: widget.iconSize,
                  splashRadius: widget.iconSize * 0.5,
                  padding: kcaInset0,
                  alignment: Alignment.center,
                  onPressed: currentPage == 1 ? null : widget.onPrevPressed,
                  icon: Icon(
                    Icons.chevron_left,
                    size: widget.iconSize,
                    color: currentPage == 1 ? kccgrey1 : kccWhite,
                  ),
                ),
              ),
            ),
            // widget.lastPage == 1
            //     ? currentPageButton()
            //     :
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                  // disabledHint: currentPageButton(),
                  //hint: currentPageButton(),

                  style: widget.labelStyle,
                  buttonStyleData: ButtonStyleData(
                    padding: kcaInset0,
                    decoration: BoxDecoration(
                      //color: isHover ? kccblack4 : null,
                      border: Border.all(color: kccWhite),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(kccBlack4),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                      //padding: EdgeInsets.symmetric(horizontal: 50.w),
                      ),
                  dropdownStyleData: DropdownStyleData(
                    padding: kcaInset0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kccOnPrimary,
                    ),
                    width: widget.pageButtonMinWidth + 20.w,
                    offset: Offset(
                        (widget.pageButtonMinWidth -
                                (widget.pageButtonMinWidth + 20.w)) /
                            2,
                        0),
                    //scrollPadding: kcaInset0,
                    // padding: EdgeInsets.symmetric(horizontal: 10),

                    isOverButton: false,
                    maxHeight: 250,
                  ),
                  customButton: currentPageButton(),
                  value: widget.lastPage == 1 ? null : currentPage.toString(),
                  items: List.generate(
                          widget.lastPage, (index) => (index + 1).toString())
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Center(child: Text(e)),
                          ))
                      .toList(),
                  onChanged: widget.onChanged),
            ),
            gapw(w: 10.w),
            Text(
              '|',
              style: widget.labelStyle?.copyWith(fontWeight: kcfmedium),
            ),
            gapw(w: 10.w),

            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: widget.pageButtonMinWidth,
                  minHeight: widget.height),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                  child: Text(
                    widget.lastPage.toString(),
                    style: widget.labelStyle,
                  ),
                ),
              ),
            ),
            Material(
              color: kccTransparent,
              child: IconButton(
                color: kccWhite,
                constraints: BoxConstraints(
                  maxHeight: widget.iconSize,
                  maxWidth: widget.iconSize,
                ),
                iconSize: widget.iconSize,
                splashRadius: widget.iconSize * 0.5,
                padding: kcaInset0,
                alignment: Alignment.center,
                onPressed: currentPage == widget.lastPage
                    ? null
                    : widget.onNextPressed,
                icon: Icon(
                  color: currentPage == widget.lastPage ? kccgrey1 : kccWhite,
                  Icons.chevron_right,
                  size: widget.iconSize,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget currentPageButton() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: widget.pageButtonMinWidth, minHeight: widget.height),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
          child: Text(
            currentPage.toString(),
            style: widget.labelStyle,
          ),
        ),
      ),
    );
  }
}
