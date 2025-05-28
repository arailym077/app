import 'package:flutter/material.dart';
import 'package:flutter_application_7/product_page.dart';

void main() => runApp(MaterialApp(home: ShopPage()));

class ShopPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'JIHC Bracelet',
      'price': '400 tg',
      'badge': 'SALE -10%',
      'image': 'assets/images/kkkkkkk.JPG',
    },
    {
      'name': 'JIHC T-shirt',
      'price': '\$198.00',
      'badge': 'NEW',
      'image': 'assets/images/clothes.JPG',
    },
    {
      'name': 'JIHC Cap',
      'price': '\$25.00',
      'badge': 'HOT',
      'image': 'assets/images/cap.jpg',
    },
    {
      'name': 'JIHC Tote Bag',
      'price': '1,500 tg',
      'badge': 'LIMITED',
      'image': 'assets/images/bag.jpg',
    },
    {
      'name': 'JIHC Notebook',
      'price': '700 tg',
      'badge': 'NEW',
      'image': 'assets/images/notebook.jpg',
    },
    {
      'name': 'JIHC Hoodie',
      'price': '\$45.00',
      'badge': 'SALE',
      'image': 'assets/images/hoodie.jpg',
    },
    {
      'name': 'JIHC Keychain',
      'price': '300 tg',
      'badge': 'HOT',
      'image': 'assets/images/keychain.jpg',
    },
    {
      'name': 'JIHC Pen',
      'price': '150 tg',
      'badge': 'NEW',
      'image': 'assets/images/pen.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('JIHC BRAND', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Promo Banner
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset('assets/images/araikusik.jpg', height: 80),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Buy 1\nGet 3', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Shop Now'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          // Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryIcon(Icons.shopping_bag, 'Bags'),
              _buildCategoryIcon(Icons.local_mall, 'Clothes'),
              _buildCategoryIcon(Icons.menu_book, 'Copybooks'),
              _buildCategoryIcon(Icons.category, 'Accessories'),
            ],
          ),
          SizedBox(height: 20),
          // New Arrivals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New Arrival', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('See all', style: TextStyle(color: Colors.orange)),
            ],
          ),
          SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: product),
                    ),
                  );
                },
                child: _buildProductCard(
                  product['name']!,
                  product['price']!,
                  product['badge']!,
                  product['image']!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 28,
          child: Icon(icon, size: 28, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildProductCard(String name, String price, String badge, String imagePath) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(imagePath, height: 120),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  color: badge.contains("SALE") ? Colors.red : Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    badge,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(price),
        ],
      ),
    );
  }
}
