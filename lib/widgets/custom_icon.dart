// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // return ClipRect(
    //   child: BackdropFilter(
    //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         border: Border.all(color: Colors.white),
    //       ),
    //       child: child,
    //     ),
    //   ),
    // );
    return Neumorphic(
      curve: Curves.elasticIn,
      style: NeumorphicStyle(
        color: Colors.black.withValues(alpha: 0.1),
        lightSource: LightSource.topLeft,
        depth: 0.5,
        intensity: 1,
        shadowLightColor: Colors.white,
        shadowDarkColor: Colors.white,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50.0)),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: child,
      ),
    );
  }
}
