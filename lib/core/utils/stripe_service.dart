import 'package:newproject/core/utils/api_keys.dart';
import 'package:newproject/core/utils/api_service.dart';
import 'package:newproject/feature/chek_out/data/models/payment_intent_input_model.dart';
import 'package:newproject/feature/chek_out/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  ApiService apiService = ApiService();
 Future <PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
  final response= await  apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token:ApiKeys.secretKey,
    );
    
      final paymentIntentModel= PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
}
