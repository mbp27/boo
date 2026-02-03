import 'package:boo/models/profile.dart';
import 'package:boo/widgets/action_button.dart';
import 'package:boo/widgets/interest_card.dart';
import 'package:boo/widgets/looking_card.dart';
import 'package:boo/widgets/personality_card.dart';
import 'package:boo/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum SwipeAction { none, like, dislike }

class NewSoulsSection extends StatefulWidget {
  const NewSoulsSection({super.key});

  @override
  State<NewSoulsSection> createState() => _NewSoulsSectionState();
}

class _NewSoulsSectionState extends State<NewSoulsSection>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late AnimationController _controller;
  late Animation<double> _anim;

  bool _isAction = false;
  SwipeAction _direction = SwipeAction.none;

  final profiles = [
    Profile(
      name: 'Anna',
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
      name: 'Mila',
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
      name: 'Sophia',
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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _anim = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          _isAction = false;
        });
      }
      if (status == AnimationStatus.completed) {
        _controller.reset();

        setState(() {
          if (currentIndex < profiles.length - 1) {
            currentIndex++;
          }
        });
      }
    });
  }

  void swipe(bool like) {
    HapticFeedback.mediumImpact();

    setState(() {
      _direction = like ? SwipeAction.like : SwipeAction.dislike;
      _isAction = true;
    });
    _reset();
  }

  void _reset() {
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final front = profiles[currentIndex];
    final back = profiles[(currentIndex + 1) % profiles.length];

    return Stack(
      alignment: Alignment.center,
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 120.0),
          child: LayoutBuilder(
            builder: (_, constraints) {
              final width = constraints.maxWidth;

              return AnimatedBuilder(
                animation: _anim,
                builder: (_, _) {
                  double t = _anim.value;

                  double dx = width * 1.2 * t;
                  if (_direction == SwipeAction.dislike) dx = -dx;

                  double rotation = 0.08 * t;
                  if (_direction == SwipeAction.dislike) {
                    rotation = -rotation;
                  }

                  double scaleFront = 1 - (0.1 * t);
                  double opacity = (1 - t).clamp(0.0, 1.0);

                  double scaleBack = 0.9 + (0.1 * t);

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.scale(scale: scaleBack, child: _content(back)),
                      Opacity(
                        opacity: opacity,
                        child: Transform.translate(
                          offset: Offset(dx, 0),
                          child: Transform.rotate(
                            angle: rotation,
                            child: Transform.scale(
                              scale: scaleFront,
                              child: _content(front),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        if (_isAction)
          Positioned(
            top: 20.0,
            child: AnimatedSlide(
              offset: _direction == SwipeAction.like
                  ? const Offset(1, 0)
                  : const Offset(-1, 0),
              duration: Duration.zero,
              child: TweenAnimationBuilder<Offset>(
                tween: Tween(
                  begin: _direction == SwipeAction.like
                      ? const Offset(1, 0)
                      : const Offset(-1, 0),
                  end: Offset.zero,
                ),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                builder: (_, offset, child) => Transform.translate(
                  offset: Offset(offset.dx * 150, 0),
                  child: child,
                ),
                child: _badge(),
              ),
            ),
          ),
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionButton(
                icon: Icons.close,
                color: Colors.red,
                onTap: () => swipe(false),
              ),
              ActionButton(
                icon: Icons.favorite,
                color: Colors.cyan,
                onTap: () => swipe(true),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _content(Profile back) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        spacing: 16,
        children: [
          ProfileCard(
            profile: back,
            size: Size.fromHeight(MediaQuery.of(context).size.height * 0.65),
          ),
          LookingCard(),
          InterestCard(),
          PersonalityCard(profile: back),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'SHARE PROFILE',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'REPORT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
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

  Widget _badge() {
    final isLike = _direction == SwipeAction.like;
    return AnimatedScale(
      scale: 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutBack,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isLike ? Colors.cyan : Colors.red,
              offset: Offset(0, -80),
              blurRadius: 200.0,
              spreadRadius: 80.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              isLike ? Icons.favorite : Icons.close,
              color: Colors.white,
              size: 130.0,
            ),
            Text(
              isLike ? 'LIKE' : 'NOPE',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
