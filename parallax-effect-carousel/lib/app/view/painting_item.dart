// ignore_for_file: prefer_const_constructors

import 'package:app/app/data/painting.dart';
import 'package:app/app/view/full_painting_screen.dart';
import 'package:app/app/view/magical_hero.dart';
import 'package:flutter/material.dart';

class PaintingItem extends StatelessWidget {
  final Painting painting;
  final double currentPage;
  final int index;

  const PaintingItem(
    this.painting, {
    Key? key,
    required this.currentPage,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return FullPaintingScreen(painting);
            },
          ),
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: MagicalHero(
                tag: '${painting.hashCode}-image',
                child: Image.asset(
                  painting.assetPath,
                  fit: BoxFit.cover,
                  height: 100.0,
                  alignment: Alignment(-currentPage.abs() + index, 0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: MagicalHero(
              tag: '${painting.hashCode}-name',
              child: Text(
                painting.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
