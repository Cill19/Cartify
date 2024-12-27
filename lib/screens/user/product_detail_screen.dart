import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String name;
  final String price;
  final String imageurl;
  final String description;

  const ProductDetailScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.imageurl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageurl.isNotEmpty
                ? Image.network(
                    imageurl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 80);
                    },
                  )
                : const Icon(Icons.image, size: 80),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Rp $price',
                style: const TextStyle(fontSize: 20, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(description, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addItem(
                    id,
                    name,
                    imageurl,
                    double.parse(
                        price.replaceAll('.', '')), // Hapus pemisah ribuan
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name ditambahkan ke keranjang')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Masukkan ke Keranjang',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
