import 'package:flutter/material.dart';
import 'package:newproject/core/widgets/cutom_app_bar.dart';
import 'package:newproject/feature/chek_out/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        context: context,
      ),
      body: Transform.translate(
          offset: const Offset(0, -15), child: const ThankYouViewBody()),
    );
  }
}
