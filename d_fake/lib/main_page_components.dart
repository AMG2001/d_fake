import 'package:d_fake/config/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerContainer extends StatelessWidget {
  // ImagePickerContainer({});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        // decoration: BoxDecoration(
        //     image:
        //         DecorationImage(image: AssetImage('assets/images/image2.jpg'))),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2)),

        width: Dimensions.width,
        height: Dimensions.height * .5,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.downloading_rounded,
                size: 36,
                color: Colors.white,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Click to Get Image/Video",
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
