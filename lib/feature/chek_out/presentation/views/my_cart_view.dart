import 'package:flutter/material.dart';
import 'package:newproject/core/widgets/cutom_app_bar.dart';
import 'package:newproject/feature/chek_out/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: 'My Cart', context: context),
      body: const MyCartViewBody(),
    );
  }
}
