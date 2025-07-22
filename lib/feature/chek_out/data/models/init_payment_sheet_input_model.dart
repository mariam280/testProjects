class InitPaymentSheetInputModel {
  final String clintSecret;
  final String ephemeralKeySecret;
  final String customerId;

  InitPaymentSheetInputModel(
      {required this.clintSecret,
      required this.ephemeralKeySecret,
      required this.customerId});
}
