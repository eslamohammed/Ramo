import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const GradientBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<GradientBottomNavigationBar> createState() =>
      _GradientBottomNavigationBarState();
}

class _GradientBottomNavigationBarState
    extends State<GradientBottomNavigationBar> {
  final List<Map<String, String>> _navItems = [
    {'icon': 'assets/image/1.svg', 'label': 'المنتجات'},
    {'icon': 'assets/image/2.svg', 'label': 'المتاجر'},
    {'icon': 'assets/image/home.svg', 'label': 'الرئيسية'},
    {'icon': 'assets/image/3.svg', 'label': 'الكوبونات'},
    {'icon': 'assets/image/4.svg', 'label': 'الفئات'},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: _BottomNavPainter(),
          ),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_navItems.length, (index) {
                final item = _navItems[index];
                final isSelected = widget.selectedIndex == index;
                final isCentralItem = index == 2;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => widget.onItemTapped(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isCentralItem)
                          Container(
                            margin: const EdgeInsets.only(bottom: 0),
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              gradient:
                                  isSelected
                                      ? const LinearGradient(
                                        colors: [
                                          Color(0xFF343EE1),
                                          Color(0xFF7D66F2),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                      : null,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow:
                                  isSelected
                                      ? [
                                        BoxShadow(
                                          color: const Color(
                                            0xFF343EE1,
                                          ).withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ]
                                      : null,
                              color: isSelected ? null : Colors.grey[200],
                            ),
                            child: SvgPicture.asset(
                              item['icon']!,
                              width: isSelected ? 26 : 24,
                              height: isSelected ? 26 : 24,
                              colorFilter: ColorFilter.mode(
                                isSelected ? Colors.white : Colors.grey[700]!,
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        else
                          SvgPicture.asset(
                            item['icon']!,
                            width: isSelected ? 28 : 22,
                            height: isSelected ? 28 : 22,
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? const Color(0xFF323EDE)
                                  : Colors.grey[700]!,
                              BlendMode.srcIn,
                            ),
                          ),
                        const SizedBox(height: 2),
                        Text(
                          item['label']!,
                          style: TextStyle(
                            color:
                                isSelected
                                    ? const Color(0xFF323EDE)
                                    : Colors.grey[700],
                            fontSize: 12,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 0);
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(10.0),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
