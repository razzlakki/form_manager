import 'base_res_model.dart';

class ProductsModel extends BaseResModel {
  int messageCode;
  String message;
  List<ProductResource> resource;

  ProductsModel({this.messageCode, this.resource});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageCode'] = this.messageCode;
    data['message'] = this.message;
    if (this.resource != null) {
      data['resource'] = this.resource.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    this.messageCode = json['messageCode'];
    if (json['resource'] != null) {
      this.resource = List<ProductResource>();
      json['resource'].forEach((v) {
        this.resource.add(ProductResource.fromJson(v));
      });
    }
    return this;
  }

  ProductsModel validateProducts() {
    if (resource != null && resource.length > 0) {
      resource.removeWhere((item) => item.getQty() <= 0);
    }
    return this;
  }
}

class ProductResource {
  String productId;
  String thumb;
  String image;
  String name;
  String categoryName;
  String description;
  String price;
  String quantity;
  String sortOrder;
  String maxOrderQuantity;
  List<Attributes> attributes;
  int rating;
  String packSize;
  String weightType;
  String href;
  String isBlockedForSale;

  ProductResource(
      {this.productId,
      this.thumb,
      this.image,
      this.name,
      this.categoryName,
      this.description,
      this.price,
      this.quantity,
      this.sortOrder,
      this.attributes,
      this.maxOrderQuantity,
      this.isBlockedForSale,
      this.rating,
      this.href});

  ProductResource.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    image = json['image'];
    name = json['name'];
    categoryName = json['category_name'];
    description = json['description'];
    maxOrderQuantity = json['max_order_quantity'];
    price = json['price'];
    quantity = json['quantity'];
    packSize = json['pack_size'];
    weightType = json['weight_type'];
    sortOrder = json['sort_order'];
    isBlockedForSale = json['is_blocked_for_sale'];
    if (json['attributes'] != null) {
      attributes = new List<Attributes>();
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
    rating = json['rating'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['category_name'] = this.categoryName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['sort_order'] = this.sortOrder;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;
    data['href'] = this.href;
    return data;
  }

  int getQty() {
    return int.parse(quantity);
  }

  int getMaxOrderQty() {
    return int.parse(maxOrderQuantity);
  }

  String getPackInfo() {
    int size = double.parse(packSize).toInt();
    return '$size $weightType Pack';
  }
}

class Attributes {
  String text;

  Attributes({this.text});

  Attributes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}
