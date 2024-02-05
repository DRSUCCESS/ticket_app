import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppColumnLayout extends StatelessWidget {
  final String text1, text2;
  final CrossAxisAlignment alignment;
  final bool? isColor;
  const AppColumnLayout(
      {super.key,
      required this.text1,
      required this.text2,
      required this.alignment,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: alignment, children: [
      Text(text1,
          style: isColor == null
              ? Styles.headLineStyle3.copyWith(color: Colors.white)
              : Styles.headLineStyle3),
      Gap(AppLayout.getHeight(5, context)),
      Text(text2,
          style: isColor == null
              ? Styles.headLineStyle4.copyWith(color: Colors.white)
              : Styles.headLineStyle4),
    ]);
  }
}
