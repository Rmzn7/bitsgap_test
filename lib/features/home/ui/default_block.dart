import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultBlock extends StatelessWidget {
  const DefaultBlock(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.iconPath});
  final String title;
  final String subtitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF11B0C8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
