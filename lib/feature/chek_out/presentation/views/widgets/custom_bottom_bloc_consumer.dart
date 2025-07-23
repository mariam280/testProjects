import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/feature/chek_out/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:newproject/feature/chek_out/presentation/views/thank_you_view.dart';
import '../../../../../core/functions/exceute_payment_card.dart';
import '../../../../../core/functions/exceute_paypal_payment.dart';
import '../../../../../core/functions/get_transaction.dart';
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
            excuteCardPayment(context);
            var transactionData = getTransaction();
            exceutePaypalPayment(context, transactionData);
          },
          text: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
