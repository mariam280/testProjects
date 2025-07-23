  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/chek_out/data/models/payment_intent_input_model.dart';
import '../../feature/chek_out/presentation/manager/payment_cubit/payment_cubit.dart';

void excuteCardPayment(BuildContext context) {
     PaymentIntentInputModel paymentIntentInputModel =
        PaymentIntentInputModel(
            currency: 'USD',
            amount: '100',
            customerId: 'cus_Sii59kHxSCkU8J');
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntenInputModel: paymentIntentInputModel);
  }