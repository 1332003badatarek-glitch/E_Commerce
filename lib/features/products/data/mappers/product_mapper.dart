import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

class ProductMapper {
  static ProductEntity toEntity(ProductModel model) {
    return ProductEntity(
      id: model.id,
      title: model.title,
      price: model.price.toDouble(),
      description: model.description,
      images: _cleanImages(model.images),
      category: model.category.toEntity(),
    );
  }

  static List<String> _cleanImages(List<String> rawImages) {
    return rawImages.map((image) {
      return image.replaceAll('[', '').replaceAll(']', '').replaceAll('"', '');
    }).toList();
  }
}
