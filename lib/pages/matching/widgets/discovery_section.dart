import 'package:boo/models/profile.dart';
import 'package:boo/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class DiscoverySection extends StatelessWidget {
  const DiscoverySection({super.key});

  @override
  Widget build(BuildContext context) {
    final profiles = [
      Profile(
        name: 'Ernest Crona',
        age: 24,
        bio: 'Love books',
        imageUrl: 'https://picsum.photos/500/800?1',
        job: 'Marketing',
        school: 'Univ',
        location: 'Bekasi 🇮🇩',
        personality: 'ESFJ',
        zodiac: 'Pisces',
      ),
      Profile(
        name: 'Clyde Goyette',
        age: 26,
        bio: 'Coffee addict',
        imageUrl: 'https://picsum.photos/500/800?2',
        job: 'Engineer',
        school: 'Univ',
        location: 'Jakarta 🇮🇩',
        personality: 'ESFJ',
        zodiac: 'Sagittarius',
      ),
      Profile(
        name: 'Nicole Brown',
        age: 22,
        bio: 'Travel',
        imageUrl: 'https://picsum.photos/500/800?3',
        job: 'Accounting',
        school: 'Univ',
        location: 'Jakarta 🇮🇩',
        personality: 'ESFJ',
        zodiac: 'Gemini',
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        spacing: 32.0,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'For You',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 16.0),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: profiles.length,
                  itemBuilder: (context, index) => ProfileCard(
                    profile: profiles[index],
                    showLike: true,
                    size: Size.fromWidth(
                      MediaQuery.of(context).size.width * 0.85,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Similar Interests',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 16.0),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: profiles.length,
                  itemBuilder: (context, index) => ProfileCard(
                    profile: profiles[index],
                    showLike: true,
                    dense: true,
                    size: Size.fromWidth(
                      MediaQuery.of(context).size.width * 0.52,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
