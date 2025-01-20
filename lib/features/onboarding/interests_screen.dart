import 'package:flutter/material.dart';
import 'package:tiktok_clone_v2/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone_v2/features/onboarding/widgets/interest_button.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../data/interest.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: const Text("Choose your interests"),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v36,
                Wrap(
                  spacing: Sizes.size12,
                  runSpacing: Sizes.size12,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest),
                  ],
                ),
                Gaps.v20,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size90,
        color: Colors.white,
        child: GestureDetector(
          onTap: _onNextTap,
          child: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size10,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size16,
                horizontal: Sizes.size24,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
