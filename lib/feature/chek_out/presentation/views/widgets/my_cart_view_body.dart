import 'package:flutter/material.dart';
import 'package:newproject/core/widgets/custom_button.dart';
import 'package:newproject/feature/chek_out/presentation/views/payment_details.dart';
import 'package:newproject/feature/chek_out/presentation/views/widgets/order_prices.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(children: [
        Expanded(child: Image.asset('assets/images/basket_image.png')),
      const  SizedBox(height: 16),
         const Column(
        spacing: 12,
        children: [
        OrderPrices(title: 'Order subtotal', price: '42.97'),
        OrderPrices(title: 'Discount', price: '0'),
        OrderPrices(title: 'Shipping', price: '8'),
      
      ],),
      const SizedBox(height: 12),
      Divider(thickness: 2, color: Colors.grey.shade300),
      const SizedBox(height: 12),
      const TotalPrice(title: 'Total', price: '50.97'),
      const SizedBox(height: 20),
      CustomButton(text: 'Complete Payment', onTap: () {
          // Handle payment completion
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => const PaymentDetails()));
        }),
      ],),
    );
  }
}