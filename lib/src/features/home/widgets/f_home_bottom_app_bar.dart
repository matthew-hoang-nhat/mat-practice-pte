import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_assets.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';

class FHomeBottomAppBar extends StatefulWidget {
  const FHomeBottomAppBar({super.key});

  @override
  State<FHomeBottomAppBar> createState() => _FHomeBottomAppBarState();
}

class _FHomeBottomAppBarState extends State<FHomeBottomAppBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      onTap: (value) {
        currentIndex = value;
        onTap(value);
        setState(() {});
      },
      currentIndex: currentIndex,
      selectedItemColor: AppColors.colorPrimary,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(CommunityMaterialIcons.home_outline),
          activeIcon: Icon(CommunityMaterialIcons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(CommunityMaterialIcons.bookmark_outline),
          activeIcon: Icon(CommunityMaterialIcons.bookmark),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
            activeIcon: Image.asset(AppAssets.iconUser,
                width: 24, color: AppColors.colorPrimary),
            icon: Image.asset(AppAssets.iconUserOutline, width: 24),
            label: 'Me'),
      ],
    );
  }

  onTap(int index) {
    switch (index) {
      case 0:
        FCoordinator.goNamed(AppPaths.home);
        break;
      case 1:
        FCoordinator.goNamed(AppPaths.saved);
        break;
      case 2:
        FCoordinator.goNamed(AppPaths.me);
        break;
      default:
    }
  }
}
