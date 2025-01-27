import 'package:flutter/material.dart';
import 'package:ichota_mobile_app/utils/constants/colors.dart';

class HomeListButton extends StatelessWidget {
  const HomeListButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.svg,
    required this.onTap,
  });
  final String label;
  final bool isSelected;
  final String svg;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(right: 0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? AppColor.blueColor.withOpacity(0.1) : null,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(
              color: AppColor.blueColor.withOpacity(0.3),
            ),
          ),
        ),
        icon: Image.asset(
          svg,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
