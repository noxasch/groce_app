import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteButton extends StatelessWidget {
  final double radius;

  const FavoriteButton({
    Key? key, 
    this.radius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFFE3E2E3),
      child: SvgPicture.asset('assets/icons/heart.svg'),
    );
  }
}
