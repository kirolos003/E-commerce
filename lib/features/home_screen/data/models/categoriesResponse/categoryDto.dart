
import 'package:e_commerce/features/home_screen/domain/models/Category.dart';

class CategoryDto {
  CategoryDto({
      this.id, 
      this.name, 
      this.slug, 
      this.image,
  });

  CategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  Category toCategory() {
    return Category(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }

}