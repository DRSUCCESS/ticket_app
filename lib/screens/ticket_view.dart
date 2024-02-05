import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/utils/widgets/column_layout.dart';
import 'package:bookticket/utils/widgets/layout_builder_widget.dart';
import 'package:bookticket/utils/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width * .85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 174 : 174,
          context), // GetPlatform is used to get the device using the application
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            /* showing the blue part of the ticket/card */
            Container(
                decoration: BoxDecoration(
                  color:
                      isColor == null ? const Color(0xFF526799) : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21)),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  /* 1st blue-row design ended*/
                  Row(children: [
                    Text(
                      ticket['from']['code'],
                      style: isColor == null
                          ? Styles.headLineStyle3.copyWith(color: Colors.white)
                          : Styles.headLineStyle3,
                    ),

                    /* middle column design */
                    // Expand (or Spacer) is used to automatically distribute content in equal sizes according to column
                    Expanded(child: Container()),
                    const ThickContainer(isColor: true),
                    Expanded(
                        // Stack is used to allow overlaped designs
                        child: Stack(children: [
                      SizedBox(
                          height: AppLayout.getHeight(24, context),
                          child: const AppLayoutBuilderWidget(sections: 6)),
                      Center(
                          child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(Icons.local_airport_rounded,
                                  color: isColor == null
                                      ? Colors.white
                                      : const Color(0xFF8ACCF7))))
                    ])),
                    const ThickContainer(isColor: true),
                    const Spacer(),

                    Text(ticket['to']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3),
                  ]), // Row 1
                  const Gap(3),
                  /* 1st blue-row design ended*/

                  /* 2nd blue-row design */
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppLayout.getWidth(100, context),
                          child: Text(ticket['from']['name'],
                              style: isColor == null
                                  ? Styles.headLineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle4),
                        ),
                        Text("8H 30M",
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4),
                        SizedBox(
                            width: AppLayout.getWidth(100, context),
                            child: Text(ticket['to']['name'],
                                textAlign: TextAlign.end,
                                style: isColor == null
                                    ? Styles.headLineStyle4
                                        .copyWith(color: Colors.white)
                                    : Styles.headLineStyle4))
                      ]) // Row 2-> for location and time
                ])),
            /* Blue-ticket container ended */

            /* showing the orange part of the ticket */
            /* orange 1st row design */
            Container(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                child: Row(children: [
                  // first semi-rounded circle
                  SizedBox(
                    height: AppLayout.getHeight(20, context),
                    width: AppLayout.getWidth(10, context),
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)))),
                  ),

                  // all through dash design
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // introduce full space inbetween the object
                            mainAxisSize:
                                MainAxisSize.max, // take the max space
                            children: List.generate(
                                (constraints.constrainWidth() / 15).floor(),
                                (index) => SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: isColor == null
                                                ? Colors.white
                                                : Colors.grey.shade300)))),
                          );
                        })),
                  ),

                  // second semi-rounded circle
                  SizedBox(
                    height: AppLayout.getHeight(20, context),
                    width: AppLayout.getWidth(10, context),
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ))),
                  )
                ])),

            /* bottom part of the orange card/ticket */
            /* orange 2nd row design */
            Container(
              decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                      bottomRight: Radius.circular(isColor == null ? 21 : 0))),
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                          text1: ticket['date'],
                          text2: 'Date',
                          alignment: CrossAxisAlignment.start,
                          isColor: isColor),
                      AppColumnLayout(
                          text1: ticket['departure_time'],
                          text2: 'Departure time',
                          alignment: CrossAxisAlignment.center,
                          isColor: isColor),
                      AppColumnLayout(
                          text1: ticket['number'].toString(),
                          text2: 'Number',
                          alignment: CrossAxisAlignment.end,
                          isColor: isColor),
                    ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
