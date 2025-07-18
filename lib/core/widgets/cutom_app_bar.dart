import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newproject/core/utils/styles.dart';

AppBar buildAppBar({required BuildContext context, final String? title}) {
  return AppBar(
    leading: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
        ),
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
