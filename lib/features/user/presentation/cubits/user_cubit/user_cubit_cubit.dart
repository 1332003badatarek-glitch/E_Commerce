import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/user/domain/entities/user_entity.dart';
import 'package:e_commerce/features/user/domain/use_cases/get_profile_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetProfileUseCase _getProfileUseCase;
  UserCubit(this._getProfileUseCase) : super(UserInitial());

  Future<void> getUserProfile() async {
    emit(UserLoading());
    final result = await _getProfileUseCase(NoParams());
    result.fold(
      (failure) => emit(UserFailure(failure.message)),
      (user) => emit(UserSuccess(user)),
    );
  }
}
