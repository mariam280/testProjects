import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:newproject/core/utils/api_keys.dart';
import 'package:newproject/feature/chek_out/data/models/amount_model/amount_model.dart';
import 'package:newproject/feature/chek_out/data/models/amount_model/details.dart';
import 'package:newproject/feature/chek_out/data/models/item_list_model/item_list_model.dart';
import 'package:newproject/feature/chek_out/data/models/item_list_model/order_item.dart';
import 'package:newproject/feature/chek_out/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:newproject/feature/chek_out/presentation/views/thank_you_view.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomBottomBlocConsumer extends StatelessWidget {
  const CustomBottomBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ThankYouView(),
              ));
        } else if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state
                  .errorMessage), /*duration: const Duration(seconds: 30),*/
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //         currency: 'USD',
            //         amount: '100',
            //         customerId: 'cus_Sii59kHxSCkU8J');
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntenInputModel: paymentIntentInputModel);
            var transactionData = getTransaction();
            exceutePaypalPayment(context, transactionData);
          },
          text: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }

  void exceutePaypalPayment(
      BuildContext context,
      ({
        AmountModel amountModel,
        ItemListModel itemListModel
      }) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clintIDPaypal,
        secretKey: ApiKeys.secretKeyPaypal,
        transactions: [
          {
            "amount": transactionData.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemListModel.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ));
  }

  ({AmountModel amountModel, ItemListModel itemListModel}) getTransaction() {      // record بعمله لو عايزة ارجع كذا datatype في نفس الميثود
    AmountModel amountModel = AmountModel(
      currency: 'USD',
      total: '70',
      details: Details(
        subtotal: '70',
        shipping: '0',
        shippingDiscount: 0,
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(name: "Apple", quantity: 4, price: '5', currency: "USD"),
      OrderItemModel(
          name: "Pineapple", quantity: 5, price: '10', currency: "USD"),
    ];
    ItemListModel itemListModel = ItemListModel(orders: orders);
    return (amountModel: amountModel, itemListModel: itemListModel);
  }
}
