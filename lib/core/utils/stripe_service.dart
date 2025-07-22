import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:newproject/core/utils/api_keys.dart';
import 'package:newproject/core/utils/api_service.dart';
import 'package:newproject/feature/chek_out/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:newproject/feature/chek_out/data/models/payment_intent_input_model.dart';
import 'package:newproject/feature/chek_out/data/models/payment_intent_model/payment_intent_model.dart';

import '../../feature/chek_out/data/models/init_payment_sheet_input_model.dart';

class StripeService {
  ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    final response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );

    final paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: initPaymentSheetInputModel.clintSecret,
      customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
      customerId: initPaymentSheetInputModel.customerId,
      merchantDisplayName: 'Mariam',
    ));
  }

  Future displayPayMentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // Future<PaymentIntentModel> createCustomer(       الميثود دي بحطها في المكان اللي بعمل فيه يوزر جديد زي createAccount
  //     PaymentIntentInputModel paymentIntentInputModel) async {
  //   final response = await apiService.post(
  //     contentType: Headers.formUrlEncodedContentType,
  //     url: 'https://api.stripe.com/v1/customers',
  //     body: paymentIntentInputModel.toJson(),
  //     token: ApiKeys.secretKey,
  //   );
  //   final paymentIntentModel = PaymentIntentModel.fromJson(response.data);
  //   return paymentIntentModel;
  // }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    final response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerId},
      token: ApiKeys.secretKey,
      headers: {
        'Stripe-Version': '2025-06-30.basil',
        'authorization': 'Bearer ${ApiKeys.secretKey}',
      },
    );

    final ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntenInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntenInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: paymentIntenInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clintSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntenInputModel.customerId,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPayMentSheet();
  }
}
