import 'package:flutter/material.dart';
import 'package:ichota_mobile_app/utils/constants/colors.dart';
import 'package:ichota_mobile_app/utils/extension/context_extensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.state,
    required this.onPressed,
    this.width = 1,
  });

  final String title;
  final bool state;
  final double width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blueColor,
          foregroundColor: AppColor.whiteColor,
          minimumSize: Size(
            context.deviceWidth * width,
            50,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: state
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(),
            )
          : Text(title),
    );
  }
}
