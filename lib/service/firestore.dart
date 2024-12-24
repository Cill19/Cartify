import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference product =
      FirebaseFirestore.instance.collection('product');

  // Menambahkan produk
  Future<void> addProduct(
      String name, String price, String description, String imageurl) async {
    await product.add({
      'name': name,
      'price': price,
      'description': description,
      'imageurl': imageurl, // Nama field sesuai dengan koleksi
    });
  }

  // Mengupdate produk
  Future<void> updateProduct(String id, String name, String price,
      String description, String imageurl) async {
    await product.doc(id).update({
      'name': name,
      'price': price,
      'description': description,
      'imageurl': imageurl, // Nama field sesuai dengan koleksi
    });
  }

  // Menghapus produk
  Future<void> removeProduct(String id) async {
    await product.doc(id).delete();
  }

  // Mendapatkan stream produk
  Stream<QuerySnapshot> getProducts() {
    return product.snapshots();
  }
}
