import 'package:flutter/material.dart';
import 'package:newproject/core/widgets/cutom_app_bar.dart';
import 'package:newproject/feature/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        context: context,
        title: 'Thank You',
      ),
      body: const ThankYouViewBody(),
    );
  }
}