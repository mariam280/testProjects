import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newproject/feature/chek_out/data/repos/check_out_repo.dart';

import '../../../data/models/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntenInputModel}) async {
    emit(PaymentLoading());
    var result = await checkOutRepo.makePayment(
        paymentIntenInputModel: paymentIntenInputModel);
    result.fold(
      (failure) {
        emit(PaymentFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(PaymentSuccess());
      },
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
