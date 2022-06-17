class Product {
  final String id;
  final String nama_produk;
  final String harga;

  Product({required this.id, required this.nama_produk, required this.harga});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as String,
        nama_produk: json['nama_produk'] as String,
        harga: json['harga_produk'] as String);
  }

  @override
  String toString() {
    return 'Product(nama_produk: $nama_produk, harga_produk: $harga)';
  }
}
