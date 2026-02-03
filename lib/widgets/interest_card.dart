import 'package:boo/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class InterestCard extends StatelessWidget {
  const InterestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12.0,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12.0,
              children: [
                Text('Interest', style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    category('horror'),
                    category('mistery'),
                    category('museums'),
                    category('food'),
                    category('movie'),
                    category('art'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12.0,
              children: [
                Text(
                  'Languages',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [language('ENGLISH'), language('INDONESIAN')],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text language(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.teal,
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  CustomCard category(String title) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text(
          '#$title',
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
