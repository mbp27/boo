// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:icon_decoration/icon_decoration.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.color,
    this.size = 40.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onTap,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
      style: NeumorphicStyle(
        color: Colors.black.withValues(alpha: 0.1),
        lightSource: LightSource.topLeft,
        depth: 1,
        intensity: 1,
        shadowLightColor: Colors.white,
        shadowDarkColor: Colors.white,
        boxShape: NeumorphicBoxShape.circle(),
      ),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: DecoratedIcon(
          icon: Icon(icon, color: color, size: size),
          decoration: IconDecoration(
            border: IconBorder(
              color: Colors.white.withValues(alpha: 0.7),
              width: 4.0,
            ),
          ),
        ),
      ),
    );
  }
}
