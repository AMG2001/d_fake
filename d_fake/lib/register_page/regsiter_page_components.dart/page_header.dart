import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Lottie.asset('assets/animated_vectors/register_animation.json',
              frameRate: FrameRate.max),
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          "Enter your Details : ",
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),

        /**
                           * Row of first and last name
                           */
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
      ],
    );
  }
}
