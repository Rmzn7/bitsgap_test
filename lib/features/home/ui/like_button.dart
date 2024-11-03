import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.id});

  final String id;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLike = false;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       setState(() {
         _isLike = !_isLike;
       });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            _isLike ? 'assets/icons/liked.svg' : 'assets/icons/unliked.svg',
          ),
        ),
      ),
    );
  }
}
