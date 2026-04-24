import '../../../user/domain/entities/user_entity.dart';
import '../models/user_model.dart';

class AuthMapper {
  static UserEntity userModelToEntityMap(UserModel model) {
    return UserEntity(
      id: model.id ?? 0,
      name: model.name ?? '',
      email: model.email ?? '',
      avatar: model.avatar ?? '',
    );
  }
}
