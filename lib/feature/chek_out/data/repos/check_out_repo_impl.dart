import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:newproject/core/errors/stripe_failure.dart';
import 'package:newproject/feature/chek_out/data/models/payment_intent_input_model.dart';
import 'package:newproject/feature/chek_out/data/repos/check_out_repo.dart';

import '../../../../core/utils/stripe_service.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntenInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntenInputModel: paymentIntenInputModel);
      return right(null);
    } on StripeException catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
