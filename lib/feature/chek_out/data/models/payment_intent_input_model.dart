class PaymentIntentInputModel {
  final String currency;
  final String amount;
  final String customerId;

  PaymentIntentInputModel({
    required this.customerId,
    required this.currency,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'customer': customerId,
      'currency': currency,
      'amount': '${amount}00', // لازم تحوله
    };
  }
}
