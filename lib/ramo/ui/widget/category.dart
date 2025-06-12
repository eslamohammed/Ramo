import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imageAssetPath;
  final String id;

  Category({
    required this.name,
    required this.imageAssetPath,
    required this.id,
  });
}

class CategoriesWidget extends StatefulWidget {
  final List<Category> allCategories;

  const CategoriesWidget({Key? key, required this.allCategories})
    : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int _currentPageIndex = 0;
  final int _gridSlots = 6;
  final int _crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = [];

    final bool hasPreviousPage = _currentPageIndex > 0;

    int categoriesPerPage = _gridSlots;
    if (hasPreviousPage) {
      categoriesPerPage--;
    }

    final bool hasNextPage =
        widget.allCategories.length >
        ((_currentPageIndex * categoriesPerPage) + categoriesPerPage);

    if (hasNextPage) {
      categoriesPerPage--;
    }

    final int categoriesStartIndex = _currentPageIndex * categoriesPerPage;
    int categoriesEndIndex = categoriesStartIndex + categoriesPerPage;

    if (categoriesEndIndex > widget.allCategories.length) {
      categoriesEndIndex = widget.allCategories.length;
    }

    final List<Category> categoriesOnPage = widget.allCategories.sublist(
      categoriesStartIndex,
      categoriesEndIndex,
    );

    if (hasPreviousPage) {
      gridItems.add(
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          // Remove color from Card as Container will handle it
          child: InkWell(
            onTap: () {
              setState(() {
                _currentPageIndex--;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF343EE1), // #343EE1
                    Color(0xFF7D66F2), // #7D66F2
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'السابق',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    for (int i = 0; i < categoriesOnPage.length; i++) {
      gridItems.add(CategoryCard(category: categoriesOnPage[i]));
    }

    if (hasNextPage) {
      gridItems.add(
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          // Remove color from Card as Container will handle it
          child: InkWell(
            onTap: () {
              setState(() {
                _currentPageIndex++;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF343EE1), // #343EE1
                    Color(0xFF7D66F2), // #7D66F2
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'التالي',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Fill remaining grid slots with empty containers to maintain layout consistency
    while (gridItems.length < _gridSlots) {
      gridItems.add(Container());
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Modified Text widget to align to the start (left for RTL text)
          Text(
            'تسوق حسب الفئات',
            textDirection: TextDirection.rtl, // Keep RTL for correct text flow
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF343EE1),
            ),
            textAlign: TextAlign.start, // Align to the start (left)
          ),
          SizedBox(height: 16),
          Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: _crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
              children: gridItems,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'الكوبونات الاكثر استخداما',
            textDirection: TextDirection.rtl, // Keep RTL for correct text flow
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF343EE1),
            ),
            textAlign: TextAlign.start, // Align to the start (left)
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          print('Tapped on ${category.name} (ID: ${category.id})');
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                category.imageAssetPath,
                width: 60,
                height: 60,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: 40, color: Colors.grey);
                },
              ),
              SizedBox(height: 5),
              Text(
                category.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
