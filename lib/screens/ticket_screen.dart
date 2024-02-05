import 'package:bookticket/screens/ticket_view.dart';
import 'package:bookticket/utils/app_info_list.dart';
import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/utils/widgets/column_layout.dart';
import 'package:bookticket/utils/widgets/layout_builder_widget.dart';
import 'package:bookticket/utils/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = AppLayout.getSize(context);

    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: Stack(children: [
          ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(20, context),
                  vertical: AppLayout.getHeight(20, context)),
              children: [
                Gap(AppLayout.getHeight(40, context)),
                Text("Tickets", style: Styles.headLineStyle1),
                Gap(AppLayout.getHeight(20, context)),
                const TicketTabs(tab1: 'Upcoming', tab2: 'Previous'), //Tabs
                Gap(AppLayout.getHeight(20, context)),

                // first ticket display
                Container(
                    padding:
                        EdgeInsets.only(left: AppLayout.getHeight(15, context)),
                    child: TicketView(ticket: ticketList[0], isColor: true)),

                const SizedBox(height: 1),
                // others' ticket display
                Container(
                    // margin: EdgeInsets,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        // flutter DB display
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppColumnLayout(
                                text1: "Flutter DB",
                                text2: "Passenger",
                                alignment: CrossAxisAlignment.start,
                                isColor: false),
                            AppColumnLayout(
                                text1: "5221 478567",
                                text2: "Passport",
                                alignment: CrossAxisAlignment.end,
                                isColor: false),
                          ],
                        ),
                        Gap(AppLayout.getHeight(20, context)),
                        const AppLayoutBuilderWidget(
                            sections: 15, isColor: false, width: 5),

                        Gap(AppLayout.getHeight(20, context)),
                        // number of ticket
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppColumnLayout(
                                text1: "364738 28274478",
                                text2: "Number of E-ticket",
                                alignment: CrossAxisAlignment.start,
                                isColor: false),
                            AppColumnLayout(
                                text1: "828568",
                                text2: "Boocking code",
                                alignment: CrossAxisAlignment.end,
                                isColor: false),
                          ],
                        ),
                        Gap(AppLayout.getHeight(20, context)),
                        const AppLayoutBuilderWidget(
                            sections: 15, isColor: false, width: 5),

                        Row(
                          children: [
                            Column(
                              children: [
                                Text('Payment method',
                                    style: Styles.headLineStyle4),
                                Row(children: [
                                  Text(' *** 2462',
                                      style: Styles.headLineStyle3),
                                  Image.asset('assets/images/visa.jpeg',
                                      scale: 11)
                                ])
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ])
        ]));
  }
}
