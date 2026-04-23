import 'package:e_commerce/features/categories/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final CategoryEntity category;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  @override
  List<Object?> get props => [id, title, price, description, images, category];
}
