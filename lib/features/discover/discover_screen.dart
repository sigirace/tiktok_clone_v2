import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

final List<String> _tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CupertinoSearchTextField(
            controller: _textController,
            placeholder: "Search",
            onChanged: (value) {
              print(value);
            },
            onSubmitted: (value) {
              print(value);
            },
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: [
              for (var tab in _tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 10,
              padding: const EdgeInsets.all(Sizes.size8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 20,
                mainAxisSpacing: Sizes.size20,
                crossAxisSpacing: Sizes.size5,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/spider_wallpaper_1.jpeg",
                        image:
                            'https://i.pinimg.com/736x/64/cf/e8/64cfe81e4d0c27af546d5edcd6c15494.jpg',
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gaps.v8,
                  const Text(
                    "This is a very long text that will be truncated, This is a very long text that will be truncated",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gaps.v8,
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: Sizes.size12,
                        backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/31294995?v=4",
                        ),
                      ),
                      Gaps.h4,
                      const Expanded(
                        child: Text(
                          "My Avartar is very long text that will be truncated, My Avartar is very long text that will be truncated",
                          style: TextStyle(
                            fontSize: Sizes.size14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gaps.h4,
                      const Icon(
                        Icons.more_vert,
                        size: Sizes.size16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            for (var tab in _tabs.skip(1)) Center(child: Text(tab)),
          ],
        ),
      ),
    );
  }
}
