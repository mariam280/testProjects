import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:newproject/core/utils/api_keys.dart';
import 'package:newproject/feature/chek_out/presentation/views/my_cart_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(
    const MyWidget(),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      builder: DevicePreview.appBuilder,
      home: MyCartView(),
    );
  }
}
