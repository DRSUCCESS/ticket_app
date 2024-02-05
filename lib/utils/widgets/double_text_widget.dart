import 'package:bookticket/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigText, smallText;
  const AppDoubleTextWidget(
      {super.key, required this.bigText, required this.smallText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: Styles.headLineStyle1,
        ),
        InkWell(
          // ignore: avoid_print
          onTap: () => print("$bigText view tapped"),
          child: Text(
            smallText,
            style: Styles.textStyle.copyWith(color: Styles.primaryColor),
          ),
        ),
      ],
    );
  }
}
