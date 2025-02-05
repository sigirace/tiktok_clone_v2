import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_v2/features/main_navigation/stf_screen.dart';
import 'package:tiktok_clone_v2/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone_v2/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone_v2/features/videos/video_timeline_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideo() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record Video"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  final screens = [
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
    Container(),
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
        ),
        height: Sizes.size88,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavTab(
              text: "Home",
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTab(
              text: "Discover",
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideo,
              child: const PostVideoButton(),
            ),
            Gaps.h24,
            NavTab(
              text: "Inbox",
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTab(
              text: "Profile",
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
