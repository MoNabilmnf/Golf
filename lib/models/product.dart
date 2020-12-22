class Category {
  int id;
  String name;
  List<Product> products;

  Category({
    this.id,
    this.name,
    this.products,
  });
}

class Product {
  int id;
  String name;
  double mainPrice;
  Coupon coupon;
  int points;

  Product({
    this.name,
    this.id,
    this.coupon,
    this.mainPrice,
    this.points,
  });
}

class Coupon {
  int id;
  String name;
  double price;
  String color;

  Coupon({
    this.id,
    this.name,
    this.price,
    this.color,
  });
}
