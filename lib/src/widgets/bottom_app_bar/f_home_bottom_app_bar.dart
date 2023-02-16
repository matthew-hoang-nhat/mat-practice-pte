import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_assets.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class FHomeBottomAppBar extends StatefulWidget {
  const FHomeBottomAppBar({super.key, required this.onTap});
  final Function(int) onTap;

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
        widget.onTap(value);
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
}
