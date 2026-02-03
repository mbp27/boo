// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boo/models/profile.dart';
import 'package:boo/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class PersonalityCard extends StatelessWidget {
  const PersonalityCard({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: DefaultTabController(
        length: 4,
        child: Builder(
          builder: (context) {
            final controller = DefaultTabController.of(context);

            return Container(
              height: MediaQuery.of(context).size.height * 0.64,
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TabBar(
                      controller: controller,
                      indicatorColor: Colors.cyan,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 4.0, color: Colors.cyan),
                        borderRadius: BorderRadius.circular(20.0),
                        insets: EdgeInsets.symmetric(horizontal: -8.0),
                      ),
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                      labelColor: Colors.white,
                      labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(text: '16 TYPE'),
                        Tab(text: 'COGNITIVE FUNCTIONS'),
                        Tab(text: 'ZODIAC'),
                        Tab(text: 'ENNEAGRAM'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        _typeContent(),
                        Center(child: Text('COGNITIVE FUNCTIONS')),
                        Center(child: Text('ZODIAC')),
                        Center(child: Text('ENNEAGRAM')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Swipe to learn more',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _typeContent() {
    final ScrollController scrollController = ScrollController();

    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8.0,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.0,
              children: [
                Column(
                  spacing: 12.0,
                  children: [
                    DecoratedIcon(
                      icon: Icon(
                        Icons.adb,
                        color: Colors.pinkAccent,
                        size: 70.0,
                      ),
                      decoration: IconDecoration(
                        border: IconBorder(color: Colors.white, width: 3.0),
                      ),
                    ),
                    _tag(
                      Icon(Icons.circle, color: Colors.red, size: 10.0),
                      profile.personality,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    spacing: 10.0,
                    children: [
                      Row(
                        spacing: 4.0,
                        children: [
                          Expanded(
                            child: Text(
                              'Peacemaker',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 5.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                              child: Text(
                                'Has Potential',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4.0,
                        children: [
                          Expanded(child: _personality('Introverted')),
                          Expanded(child: _personality('Intuitive')),
                          Expanded(child: _personality('Feeling')),
                          Expanded(child: _personality('Perceiving')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Peacemakers are optimists always looking for the good in people, '
              'even in the worst of situations. They\'re accepting, open-minded, '
              'imaginative, and spiritual. They are guided by their inner moral '
              'compass and the desire to do right by their values. They desire a '
              'life of meaning, personal significance, and individual expression.',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Row(
              spacing: 8.0,
              children: [
                Icon(Icons.thumb_up, color: Colors.amber),
                Text(
                  'Strengths',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Wrap(
              spacing: 10.0,
              runSpacing: 16.0,
              children: [
                _tag(null, 'idealistic'),
                _tag(null, 'harmounious'),
                _tag(null, 'open-minded'),
                _tag(null, 'flexible'),
                _tag(null, 'creative'),
                _tag(null, 'idealistic'),
                _tag(null, 'harmounious'),
                _tag(null, 'open-minded'),
                _tag(null, 'flexible'),
                _tag(null, 'creative'),
                _tag(null, 'idealistic'),
                _tag(null, 'harmounious'),
                _tag(null, 'open-minded'),
                _tag(null, 'flexible'),
                _tag(null, 'creative'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CustomCard _personality(String title) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
        child: Column(
          spacing: 12.0,
          children: [
            Text(title, style: TextStyle(fontSize: 10.0)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Text(
                '--',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag(Icon? icon, String text) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
            if (icon != null)
              DecoratedIcon(
                icon: icon,
                decoration: IconDecoration(
                  border: IconBorder(color: Colors.white, width: 2.0),
                ),
              ),
            Text(
              text,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
