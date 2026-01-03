import 'package:azteron_case/core/constants/app_assets.dart';
import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagesBottomNav extends StatelessWidget {
  const MessagesBottomNav({
    this.currentIndex = 3,
    super.key,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final assets = AppAssets.instance;
    final activeColor = context.colorScheme.primary;
    final inactiveColor = context.appColors.textTertiary;
    final backgroundColor = context.theme.scaffoldBackgroundColor;

    // Figma design: Drop shadow + top border
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: context.appColors.borderColor,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -4), // Shadow going upward
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home
              _NavItem(
                icon: assets.homeIcon,
                isActive: currentIndex == 0,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: () {},
              ),
              // Discover
              _NavItem(
                icon: assets.discoverIcon,
                isActive: currentIndex == 1,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: () {},
              ),
              // Like/Heart
              _NavItem(
                icon: assets.likeIcon,
                isActive: currentIndex == 2,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: () {},
              ),
              // Chat/Messages - special active state with circle
              _ChatNavItem(
                icon: assets.chattingIcon,
                isActive: currentIndex == 3,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: () {},
              ),
              // Profile
              _NavItem(
                icon: assets.profileIcon,
                isActive: currentIndex == 4,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Standard navigation item with color change on active state.
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  final String icon;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isActive ? activeColor : inactiveColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

/// Chat navigation item with circular background when active (Figma design).
class _ChatNavItem extends StatelessWidget {
  const _ChatNavItem({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  final String icon;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Center(
          child: isActive
              ? Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: activeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              : SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    inactiveColor,
                    BlendMode.srcIn,
                  ),
                ),
        ),
      ),
    );
  }
}
