class CartModel {
  late final int? id;
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final int? productPrice;
  final int? quantity;
  final String unitTag;
  final String? image;

  CartModel({
    required this.id,
    required this.image,
    required this.initialPrice,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.unitTag,
  });

  CartModel.fromMap(Map<dynamic, dynamic> res)
    : id = res['id'],
      productId = res['productId'],
      productName = res['productName'],
      initialPrice = res['initialPrice'],
      quantity = res['quatity'],
      unitTag = res['unitTag'],
      productPrice = res['productPrice'],
      image = res['image'];
}
