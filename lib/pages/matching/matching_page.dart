import 'dart:ui';

import 'package:boo/pages/matching/widgets/discovery_section.dart';
import 'package:boo/pages/matching/widgets/new_souls_section.dart';
import 'package:flutter/material.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({super.key});

  @override
  State<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  final indicatorColors = [Colors.cyan, Colors.pinkAccent];

  final _scrollController = ScrollController();
  final _offset = ValueNotifier(0.0);
  final _tabBarHeight = 38.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      _offset.value = offset;
    });
  }

  Color _animatedIndicatorColor(TabController controller) {
    final animationValue =
        controller.animation?.value ?? controller.index.toDouble();

    final fromIndex = animationValue.floor().clamp(
      0,
      indicatorColors.length - 1,
    );
    final toIndex = animationValue.ceil().clamp(0, indicatorColors.length - 1);

    final t = animationValue - fromIndex;

    return Color.lerp(indicatorColors[fromIndex], indicatorColors[toIndex], t)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Builder(
          builder: (context) {
            final tabController = DefaultTabController.of(context);

            return Stack(
              children: [
                NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      bottom: PreferredSize(
                        preferredSize: Size(0, _tabBarHeight),
                        child: AnimatedBuilder(
                          animation: tabController.animation!,
                          builder: (context, _) => SizedBox(
                            height: _tabBarHeight,
                            child: TabBar(
                              controller: tabController,
                              dividerHeight: 0,
                              labelColor: Colors.black,
                              labelPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                              indicator: BoxDecoration(
                                color: _animatedIndicatorColor(tabController),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              splashBorderRadius: BorderRadius.circular(50.0),
                              tabAlignment: TabAlignment.center,
                              tabs: [
                                Tab(text: 'NEW SOULS'),
                                Tab(text: 'DISCOVERY'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  body: TabBarView(
                    controller: tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [NewSoulsSection(), DiscoverySection()],
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: ValueListenableBuilder<double>(
                    valueListenable: _offset,
                    builder: (context, value, _) => ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: value > 0
                              ? Colors.black.withValues(alpha: 0.1)
                              : Theme.of(context).scaffoldBackgroundColor,
                          alignment: Alignment.center,
                          child: SafeArea(
                            child: Text(
                              'BOO',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
                                fontVariations: [FontVariation.width(50.0)],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
