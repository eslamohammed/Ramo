import 'package:flutter/material.dart';

class CategoryCobon {
  final String name;
  final String imageAssetPath;
  final String id;

  CategoryCobon({
    required this.name,
    required this.imageAssetPath,
    required this.id,
  });
}

class HorizontalImageList extends StatelessWidget {
  final List<String> imageUrls;

  const HorizontalImageList({Key? key, required this.imageUrls})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 175.83,
      child: Directionality(
        textDirection: TextDirection.rtl, // Set scrolling direction to RTL
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  width: 338.21 - 30,
                  height: 175.83,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
