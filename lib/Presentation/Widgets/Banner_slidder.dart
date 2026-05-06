import 'package:flutter/material.dart';

class BannerSlidder extends StatefulWidget {
  const BannerSlidder({super.key});

  @override
  State<BannerSlidder> createState() => _BannerSlidderState();
}

class _BannerSlidderState extends State<BannerSlidder> {
   int index = 0;

  final images = [
    "assets/banner1.jpg",
    "assets/banner2.jpg",
    "assets/banner3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (context, i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(images[i]), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: index == i ? 10 : 6,
              height: index == i ? 10 : 6,
              decoration: BoxDecoration(
                color: index == i ? Colors.black : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}