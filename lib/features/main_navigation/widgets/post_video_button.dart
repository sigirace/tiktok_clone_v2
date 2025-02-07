import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: Sizes.size28,
          child: Container(
            width: Sizes.size32,
            height: Sizes.size36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size8),
              color: Colors.blue,
            ),
          ),
        ),
        Positioned(
          left: Sizes.size28,
          child: Container(
            width: Sizes.size32,
            height: Sizes.size36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size8),
              color: Colors.red,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size8,
          ),
          height: Sizes.size36,
          width: Sizes.size56,
          decoration: BoxDecoration(
            color: selectedIndex == 0 ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(Sizes.size8),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: selectedIndex == 0 ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
