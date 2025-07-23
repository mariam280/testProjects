import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newproject/core/widgets/custom_button.dart';
import 'package:newproject/feature/chek_out/presentation/views/thank_you_view.dart';
import 'package:newproject/feature/chek_out/presentation/views/widgets/custom_credit_card.dart';
import 'package:newproject/feature/chek_out/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
      child: CustomScrollView(
        slivers: [
          // const SliverToBoxAdapter(
          //   child: PaymentMethodsListView(),
          // ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
                formKey: formKey, autovalidateMode: autovalidateMode),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  text: 'Pay',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      log('Payment Successful');
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ThankYouView(),
                        ),
                      );
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
