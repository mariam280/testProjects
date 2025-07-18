import 'package:flutter/material.dart';
import 'package:newproject/core/widgets/cutom_app_bar.dart';
import 'package:newproject/feature/presentation/views/widgets/payment_details_body.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        context: context,
        title: 'Payment Details',
      ),
      body:const PaymentDetailsBody(),
    );
  }
}