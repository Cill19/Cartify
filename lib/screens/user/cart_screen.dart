import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final String name;
  final String price;
  final String imageurl;

  const CartScreen({
    Key? key,
    required this.name,
    required this.price,
    required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            imageurl.isNotEmpty
                ? Image.network(
                    imageurl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image,
                          size: 80,
                          color: Colors.grey,
                        ),
                      );
                    },
                  )
                : Container(
                    color: Colors.grey[200],
                    height: 200,
                    child: const Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
            const SizedBox(height: 16),
            // Nama produk
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Harga produk
            Text(
              'Rp $price',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            // Tombol Checkout
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika checkout di sini
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout berhasil!')),
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
                  'Checkout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
