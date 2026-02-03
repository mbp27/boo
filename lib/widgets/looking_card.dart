import 'package:boo/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class LookingCard extends StatelessWidget {
  const LookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12.0,
          children: [
            Row(
              spacing: 16.0,
              children: [
                Text('LOOKING FOR', style: TextStyle(fontSize: 12.0)),
                Text('Friends'),
              ],
            ),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                category(Icons.favorite, 'Single'),
                category(Icons.favorite, 'Monogamous'),
                category(Icons.favorite, 'Sometimes'),
                category(Icons.favorite, 'Muslim'),
                category(Icons.favorite, 'Javanese'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CustomCard category(IconData icon, String title) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
            Icon(icon, size: 14.0, color: Colors.teal),
            Text(
              title,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
