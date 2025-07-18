import 'package:flutter/material.dart';
import 'package:newproject/feature/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
      ],
    );
  }
}