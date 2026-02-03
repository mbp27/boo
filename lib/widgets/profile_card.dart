// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boo/models/profile.dart';
import 'package:boo/widgets/action_button.dart';
import 'package:boo/widgets/custom_card.dart';
import 'package:boo/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final Size size;
  final bool showLike;
  final bool dense;

  const ProfileCard({
    super.key,
    required this.profile,
    required this.size,
    this.showLike = false,
    this.dense = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: CustomCard(
        child: Stack(
          children: [
            Image.network(
              profile.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              right: 16.0,
              child: _headerTag(
                Icon(Icons.favorite, size: 14.0, color: Colors.teal),
                'HORROR',
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 4.0,
                          children: [
                            Flexible(
                              child: Text(
                                profile.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: dense ? 18.0 : 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(Icons.check_circle, color: Colors.cyan),
                          ],
                        ),
                        if (!dense)
                          DefaultTextStyle.merge(
                            style: TextStyle(fontWeight: FontWeight.w500),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  spacing: 4.0,
                                  children: [
                                    Icon(
                                      Icons.business_center_outlined,
                                      size: 16.0,
                                    ),
                                    Text(profile.job),
                                  ],
                                ),
                                Row(
                                  spacing: 4.0,
                                  children: [
                                    Icon(Icons.school_outlined, size: 16.0),
                                    Text(profile.school),
                                  ],
                                ),
                                Row(
                                  spacing: 4.0,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16.0,
                                    ),
                                    Text(profile.location),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                DefaultTextStyle.merge(
                                  style: TextStyle(fontSize: 12.0),
                                  child: Wrap(
                                    runAlignment: WrapAlignment.start,
                                    spacing: 10.0,
                                    children: [
                                      _tag(
                                        Icon(
                                          Icons.female,
                                          color: Colors.red,
                                          size: 12.0,
                                        ),
                                        '${profile.age}',
                                      ),
                                      _tag(
                                        Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 10.0,
                                        ),
                                        profile.personality,
                                      ),
                                      _tag(
                                        Icon(
                                          Icons.brightness_high,
                                          color: Colors.teal,
                                          size: 12.0,
                                        ),
                                        profile.zodiac,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (showLike)
                    ActionButton(
                      icon: Icons.favorite,
                      color: Colors.pinkAccent,
                      size: 28.0,
                      onTap: () {},
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomIcon _headerTag(Icon icon, String text) {
    final borderText = Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w800,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.black,
      ),
    );

    return CustomIcon(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
            DecoratedIcon(
              icon: icon,
              decoration: IconDecoration(border: IconBorder(width: 2.0)),
            ),
            Stack(
              children: [
                borderText,
                Text(
                  text,
                  style: TextStyle(
                    fontSize: borderText.style?.fontSize,
                    fontWeight: borderText.style?.fontWeight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CustomIcon _tag(Icon icon, String text) {
    return CustomIcon(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
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
