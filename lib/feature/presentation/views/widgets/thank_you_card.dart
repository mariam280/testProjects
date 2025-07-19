import 'package:flutter/material.dart';
import 'package:newproject/feature/presentation/views/widgets/card_info_widget.dart';
import 'package:newproject/feature/presentation/views/widgets/order_prices.dart';
import 'package:newproject/feature/presentation/views/widgets/thank_you_view_footer.dart';

import '../../../../core/utils/styles.dart';
import 'payment_info_item.dart';

class YhankYouCard extends StatelessWidget {
  const YhankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 30 + 30, bottom: 30, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            const Column(
              spacing: 20,
              children: [
                PaymentItemInfo(
                  title: 'Date',
                  value: '01/24/2023',
                ),
                PaymentItemInfo(
                  title: 'Time',
                  value: '10:15 AM',
                ),
                PaymentItemInfo(
                  title: 'To',
                  value: 'Sam Louis',
                ),
              ],
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            const TotalPrice(title: 'Total', price: r'$50.97'),
            const SizedBox(
              height: 30,
            ),
           const CardInfoWidget(),
           const  Spacer(),
           const ThankYouViewFooter(),
             SizedBox(
             height: MediaQuery.of(context).size.height * 0.0230,
            ),
          ],
        ),
      ),
    );
  }
}
