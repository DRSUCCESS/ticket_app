import 'package:bookticket/utils/app_layout.dart';
import 'package:flutter/material.dart';

class TicketTabs extends StatelessWidget {
  final String tab1;
  final String tab2;
  const TicketTabs({super.key, required this.tab1, required this.tab2});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return FittedBox(
        child: Container(
      padding: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(50, context)),
          color: const Color(0xFFF4F6FD)),
      child: Row(
        children: [
          /* Tab1 -> Airline tickets */
          Container(
              width: size.width * .44,
              padding: EdgeInsets.symmetric(
                  vertical: AppLayout.getHeight(7, context)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(
                          AppLayout.getHeight(50, context)) // double tab radius
                      ),
                  color: Colors.white),
              child: Center(child: Text(tab1))),
          /* Tab2 -> Hotels */
          Container(
            width: size.width * .44,
            padding:
                EdgeInsets.symmetric(vertical: AppLayout.getHeight(7, context)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(
                        AppLayout.getHeight(50, context)) // double tab radius
                    ),
                color: Colors.transparent),
            child: Center(child: Text(tab2)),
          ),
        ],
      ),
    ));
  }
}
