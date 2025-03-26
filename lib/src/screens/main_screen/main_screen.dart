import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:startup_app/resources/app_assets.dart';
import 'package:startup_app/resources/custom_style.dart';
import 'package:startup_app/src/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndexBottom = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndexBottom,
        children: const [
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            useLegacyColorScheme: false,
            currentIndex: _currentIndexBottom,
            onTap: (value) {
              setState(() {
                _currentIndexBottom = value;
              });
            },
            selectedLabelStyle: CustomStyle.body1Text().copyWith(color: Theme.of(context).colorScheme.primary),
            unselectedLabelStyle: CustomStyle.body1Text().copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
            items: [
              _buildBottomBarItem(
                icon: AppAssets.icHome,
                activeIcon: AppAssets.icHomeActive,
                label: '',
              ),
              _buildBottomBarItem(
                icon: AppAssets.icList,
                activeIcon: AppAssets.icListActive,
                label: '',
              ),
              _buildAddButton(),
              _buildBottomBarItem(
                icon: AppAssets.icNotification,
                activeIcon: AppAssets.icNotificationActive,
                label: '',
              ),
              _buildBottomBarItem(
                icon: AppAssets.icAccount,
                activeIcon: AppAssets.icAccountActive,
                label: '',
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomBarItem({
    required String icon,
    required String activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: SvgPicture.asset(
          icon,
          height: 20.h,
          colorFilter:
              icon == AppAssets.icAdd ? ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn) : null,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: SvgPicture.asset(
          activeIcon,
          height: 26.h,
          colorFilter: activeIcon == AppAssets.icAdd
              ? ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn)
              : null,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildAddButton() {
    return BottomNavigationBarItem(
      label: '',
      icon: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Container(
          width: 68.w,
          height: 68.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
            ),
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.icAdd,
              height: 30.h,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.surface, BlendMode.srcIn),
            ),
          ),
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Container(
          width: 68.w,
          height: 68.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
            ),
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.icAdd,
              height: 30.h,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.surface, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
