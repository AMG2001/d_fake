import 'package:d_fake/config/vectos_paths.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderImageLoginPage extends StatelessWidget {
  const HeaderImageLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Lottie.asset(VectorsPaths.loginPageAnimation));
  }
}
