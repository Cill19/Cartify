class CartItem {
  final String id;
  final String name;
  final String imageurl;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageurl,
    required this.price,
    this.quantity = 1,
  });
}
