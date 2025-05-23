import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first project in VS Code && github'),
        ),
        body: const Center(
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.amber,
            child: Text(
              'Eng:Mariam',
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}


