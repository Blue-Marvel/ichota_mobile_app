import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ichota_mobile_app/features/home/presentation/widgets/home_card.dart';
import 'package:ichota_mobile_app/features/home/presentation/widgets/home_list_button.dart';
import 'package:ichota_mobile_app/shared/styles/text_style.dart';
import 'package:ichota_mobile_app/utils/constants/colors.dart';
import 'package:ichota_mobile_app/utils/constants/images.dart';
import 'package:ichota_mobile_app/utils/extension/context_extensions.dart';

part 'mixin/home_mixin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with _HomeMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AppSvg.appLogo,
            colorFilter: ColorFilter.mode(AppColor.blueColor, BlendMode.srcIn),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppSvg.search,
              ),
            ),
            10.horizontalSpace,
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppSvg.themeMode,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            dividerHeight: 2,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextRegular('For Sale'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextRegular(
                  'Service',
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HomeListButton(
                          onTap: () {
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                          svg: AppImage.latestIcon,
                          isSelected: currentIndex == 0,
                          label: 'Latest',
                        ),
                        HomeListButton(
                          onTap: () {
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                          svg: AppImage.category,
                          isSelected: currentIndex == 1,
                          label: 'Category',
                        ),
                        HomeListButton(
                          onTap: () {
                            setState(() {
                              currentIndex = 2;
                            });
                          },
                          svg: AppImage.free,
                          isSelected: currentIndex == 2,
                          label: 'Free',
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 10,
                    children: [
                      SvgPicture.asset(AppSvg.locationPin),
                      TextRegular(
                        'California',
                        color: AppColor.blueColor,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Expanded(
                      child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      return HomeCard();
                    },
                  ))
                ],
              ),
            ),
            //Second tab (service)
            Container(),
          ],
        ),
      ),
    );
  }
}
