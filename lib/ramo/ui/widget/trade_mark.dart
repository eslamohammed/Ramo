import 'package:flutter/material.dart';

class TradeMark {
  final String name;
  final String imageAssetPath;
  final String id;

  TradeMark({
    required this.name,
    required this.imageAssetPath,
    required this.id,
  });
}

class HorizontalImageList2 extends StatelessWidget {
  final List<String> imageUrls;

  const HorizontalImageList2({Key? key, required this.imageUrls})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 95,
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
                    width: 116,
                    height: 95,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
