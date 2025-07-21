import 'package:flutter/material.dart';
import 'package:newproject/core/utils/styles.dart';

class OrderPrices extends StatelessWidget {
  const OrderPrices({super.key, required this.title, required this.price});
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style18.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$$price',
          style: Styles.style18.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.price});
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style24,
        ),
        Text(
          '\$$price',
          style: Styles.style24,
        ),
      ],
    );
  }
}
