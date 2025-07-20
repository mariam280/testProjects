import 'package:dartz/dartz.dart';

import '../../../../core/errors/stripe_failure.dart';
import '../models/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure,void>> makePayment(
      {required PaymentIntentInputModel paymentIntenInputModel});
}



