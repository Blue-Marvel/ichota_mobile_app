import 'package:flutter/material.dart';
import 'package:ichota_mobile_app/shared/styles/text_style.dart';
import 'package:ichota_mobile_app/utils/constants/colors.dart';
import 'package:ichota_mobile_app/utils/extension/context_extensions.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/28539583/pexels-photo-28539583/free-photo-of-majestic-mountain-peaks-at-sunrise.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            TextRegular(
              '\$400',
              fontWeight: FontWeight.w600,
              color: AppColor.blueColor,
            ),
            10.horizontalSpace,
            Expanded(
              child: TextRegular(
                "Large House sales",
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      ],
    );
  }
}
