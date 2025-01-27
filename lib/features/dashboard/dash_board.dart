import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichota_mobile_app/features/home/presentation/home.dart';
import 'package:ichota_mobile_app/utils/constants/colors.dart';
import 'package:ichota_mobile_app/utils/constants/images.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  static const String routeName = '/dashboard';

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [HomeScreen(), Container()][0],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.blueColor,
        unselectedItemColor: AppColor.greyColor,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.home,
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? AppColor.blueColor : AppColor.greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.messages,
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? AppColor.blueColor : AppColor.greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.post,
              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? AppColor.blueColor : AppColor.greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.notification,
              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? AppColor.blueColor : AppColor.greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.profile,
              colorFilter: ColorFilter.mode(
                currentIndex == 4 ? AppColor.blueColor : AppColor.greyColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
