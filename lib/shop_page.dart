import 'package:flutter/material.dart';
import 'package:flutter_application_7/product_detail_page.dart';
import 'product_detail_page.dart';

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
      'image': 'assets/images/telepon1.jpg',
    },
    {
      'name': 'JIHC Tote Bag',
      'price': '1,500 tg',
      'badge': 'LIMITED',
      'image': 'assets/images/zat2.jpg',
    },
    {
      'name': 'JIHC Notebook',
      'price': '700 tg',
      'badge': 'NEW',
      'image': 'assets/images/sumka.jpg',
    },
    {
      'name': 'JIHC Hoodie',
      'price': '\$45.00',
      'badge': 'SALE',
      'image': 'assets/images/braslet.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Welcome, Student', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.shopping_bag), text: 'Bags'),
              Tab(icon: Icon(Icons.local_mall), text: 'Clothes'),
              Tab(icon: Icon(Icons.menu_book), text: 'Copybooks'),
              Tab(icon: Icon(Icons.category), text: 'Accessories'),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(4, (index) => _buildProductGrid(context)),
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(product: product)));
          },
          child: _buildProductCard(product),
        );
      },
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(product['image']!, height: 120),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  color: product['badge']!.contains('SALE') ? Colors.red : Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(product['badge']!, style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(product['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(product['price']!),
        ],
      ),
    );
  }
}
