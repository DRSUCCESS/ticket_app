import 'package:bookticket/utils/app_layout.dart';
import 'package:bookticket/utils/app_styles.dart';
import 'package:bookticket/utils/widgets/double_text_widget.dart';
import 'package:bookticket/utils/widgets/icon_text_widget.dart';
import 'package:bookticket/utils/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    // ignore: avoid_print
    // print("ration:${Dimensions.screenPixel}, screenHeight: ${Dimensions.screenHeight}, ScreenWidth: ${Dimensions.screenWidth}");
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(10, context),
              vertical: AppLayout.getHeight(20, context)),
          children: [
            Gap(AppLayout.getHeight(40, context)),
            Text(
              "What are \nyou looking for?",
              style: Styles.headLineStyle1
                  .copyWith(fontSize: AppLayout.getWidth(35, context)),
            ),
            Gap(AppLayout.getHeight(20, context)),
            const TicketTabs(
              tab1: 'Airline tickets',
              tab2: 'Hotels',
            ),

            Gap(AppLayout.getHeight(25, context)),
            // filling box
            const AppIconText(
                icon: Icons.flight_takeoff_rounded, text: "Departure"),
            Gap(AppLayout.getHeight(10, context)),
            const AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
            Gap(AppLayout.getHeight(25, context)),
            // find ticket button
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppLayout.getHeight(18, context),
                  horizontal: AppLayout.getWidth(15, context)),
              decoration: BoxDecoration(
                  color: const Color(0xD91130CE),
                  borderRadius:
                      BorderRadius.circular(AppLayout.getWidth(10, context))),
              child: Center(
                  child: Text("find tickets",
                      style: Styles.textStyle.copyWith(
                        color: Colors.white,
                      ))),
            ),
            const Gap(40),

            // Flight Header
            const AppDoubleTextWidget(
                bigText: "Upcoming Flights", smallText: "View all"),
            Gap(AppLayout.getHeight(15, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: AppLayout.getHeight(420, context),
                  width: size.width * .42,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(15, context),
                      vertical: AppLayout.getHeight(15, context)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          AppLayout.getHeight(12, context)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 1,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: AppLayout.getHeight(190, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppLayout.getHeight(12, context)),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/sit.jpeg")),
                        ),
                      ),
                      Gap(AppLayout.getHeight(12, context)),
                      Text(
                          "20% discount on the early booking of this flight. Don't miss.",
                          style: Styles.headLineStyle2.copyWith())
                    ],
                  ),
                ),
                Column(
                  children: [
                    // use Stack widget to infuse/merge two containers (discount & circle containers)
                    Stack(children: [
                      // disocunt container 
                      Container(
                        width: size.width * .44,
                        height: AppLayout.getHeight(210, context),
                        decoration: BoxDecoration(
                            color: const Color(0xFF3ABBBB),
                            borderRadius: BorderRadius.circular(
                                AppLayout.getHeight(18, context))),
                        padding: EdgeInsets.symmetric(
                            vertical: AppLayout.getHeight(15, context),
                            horizontal: AppLayout.getWidth(10, context)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Discount\nfor survey",
                                  style: Styles.headLineStyle2
                                      .copyWith(color: Colors.white)),
                              Gap(AppLayout.getHeight(10, context)),
                              Text(
                                  "Take the survey about our services and get discount",
                                  style: Styles.headLineStyle2.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                            ]),
                      ),
                      // dicount circle design, positioned to top-right corner
                      Positioned(
                        top: -40,
                        right: -45,
                        child: Container(
                          padding:
                              EdgeInsets.all(AppLayout.getHeight(30, context)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 18, color: const Color(0XFF189999)),
                            color: Colors.transparent,
                          ),
                        ),
                      )
                    ]),
                    Gap(AppLayout.getHeight(10, context)),
                    Container(
                      width: size.width * .44,
                      height: AppLayout.getHeight(200, context),
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(15, context),
                          horizontal: AppLayout.getWidth(15, context)),
                      decoration: BoxDecoration(
                          color: const Color(0xFFEC6545),
                          borderRadius: BorderRadius.circular(18)),
                      child: Column(children: [
                        Text(
                          "Take love",
                          style: Styles.headLineStyle2
                              .copyWith(color: Colors.white),
                        ),
                        Gap(AppLayout.getHeight(5, context)),
                        // RichText: allows the use of emoji with different styles
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(text: "😍", style: TextStyle(fontSize: 28)),
                          TextSpan(text: "🥰", style: TextStyle(fontSize: 40)),
                          TextSpan(text: "😘", style: TextStyle(fontSize: 28)),
                        ]))
                      ]),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
