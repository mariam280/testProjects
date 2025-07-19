import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:newproject/feature/presentation/views/my_cart_view.dart';

void main() {
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
      home:  MyCartView(),
    );
  }
}