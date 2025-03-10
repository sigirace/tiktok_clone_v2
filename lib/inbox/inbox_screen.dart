import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_v2/inbox/activity_screen.dart';

import '../constants/sizes.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onDmPressed() {
    print("DM pressed");
  }

  void _onActivityPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ActivityScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        actions: [
          IconButton(
            onPressed: _onDmPressed,
            icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => _onActivityPressed(context),
            title: const Text(
              'Activity',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
          Container(
            height: Sizes.size1,
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: Container(
              width: Sizes.size52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                ),
              ),
            ),
            title: const Text(
              'New followers',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
            ),
            subtitle: const Text(
              'Messages from followers will appear here',
              style: TextStyle(
                fontSize: Sizes.size14,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
