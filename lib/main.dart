import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:newproject/screens/my_cart_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const MyCartView(),
    );
  }
}


