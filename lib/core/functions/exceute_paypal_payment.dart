 import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../feature/chek_out/data/models/amount_model/amount_model.dart';
import '../../feature/chek_out/data/models/item_list_model/item_list_model.dart';
import '../../feature/chek_out/presentation/views/thank_you_view.dart';
import '../utils/api_keys.dart';

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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
          Navigator.pop(context);

        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ));
  }