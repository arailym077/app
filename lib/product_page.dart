import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopPage(),
    );
  }
}

class ShopPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'JIHC Bracelet',
      'price': '400 tg',
      'badge': 'SALE -10%',
      'image': 'assets/images/kkkkkkk.JPG'
    },
    {
      'name': 'JIHC T-shirt',
      'price': '\$198.00',
      'badge': 'NEW',
      'image': 'assets/images/clothes.JPG'
    },
    {
      'name': 'JIHC Cap',
      'price': '300 tg',
      'badge': 'NEW',
      'image': 'assets/images/cap.jpg'
    },
    {
      'name': 'JIHC Bag',
      'price': '1500 tg',
      'badge': 'LIMITED',
      'image': 'assets/images/bag.jpg'
    },
    {
      'name': 'JIHC Hoodie',
      'price': '2500 tg',
      'badge': 'SALE -20%',
      'image': 'assets/images/hoodie.jpg'
    },
    {
      'name': 'JIHC Notebook',
      'price': '800 tg',
      'badge': 'NEW',
      'image': 'assets/images/notebook.jpg'
    },
    {
      'name': 'JIHC Keychain',
      'price': '200 tg',
      'badge': 'HOT',
      'image': 'assets/images/keychain.jpg'
    },
    {
      'name': 'JIHC Mug',
      'price': '600 tg',
      'badge': 'GIFT',
      'image': 'assets/images/mug.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'JIHC BRAND',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(product: product),
                ),
              ),
              child: _buildProductCard(product),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(product['image'] ?? '', height: 120, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  color: product['badge']!.contains("SALE") ? Colors.red : Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    product['badge'] ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            product['name'] ?? '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(product['price'] ?? ''),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    final name = product['name'] ?? 'Unnamed';
    final price = product['price'] ?? 'Unknown';
    final image = product['image'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(image, height: 200, errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey.shade300,
                child: Center(child: Icon(Icons.broken_image)),
              );
            }),
            SizedBox(height: 24),
            Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(price, style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 16),
            Text(
              'This is a detailed description of the product. More information can be shown here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}