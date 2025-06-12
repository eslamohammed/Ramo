import 'package:flutter/material.dart';

class MyOfferCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/image/Group@3x.png',
            height: 166,
            width: 300, // نفس عرض الكارد
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
