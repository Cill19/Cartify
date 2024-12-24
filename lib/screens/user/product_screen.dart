import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'price': 200000,
      'image': 'assets/images/mobil1.png', // Perbaikan jalur gambar
    },
    {
      'name': 'Product 2',
      'price': 150000,
      'image': 'assets/images/mobil1.png',
    },
    {
      'name': 'Product 3',
      'price': 300000,
      'image': 'assets/images/mobil1.png',
    },
    {
      'name': 'Product 4',
      'price': 250000,
      'image': 'assets/images/mobil1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar produk
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child:
                                Icon(Icons.error, color: Colors.red, size: 40),
                          );
                        },
                      ),
                    ),
                  ),
                  // Nama produk
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Harga produk
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Rp ${product['price']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  // Tombol aksi
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product['name']} added to cart!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart,
                          color: Colors.white),
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
