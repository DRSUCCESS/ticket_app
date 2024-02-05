import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  final int sections;
  final bool? isColor;
  final double width;
  const AppLayoutBuilderWidget(
      {super.key, required this.sections, this.isColor,  this.width=3});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // ignore: avoid_print
      // print("The width is ${constraints.constrainWidth()}");
      return Flex(
        // automatically create dash line, distribute it equally acoording to the constraintWidth/6, with white color
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
            (constraints.constrainWidth() / sections).floor(),
            // dash line width & height
            (index) => SizedBox(
                  width: width,
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.white
                              : Colors.grey.shade300)),
                )),
      );
    });
  }
}
